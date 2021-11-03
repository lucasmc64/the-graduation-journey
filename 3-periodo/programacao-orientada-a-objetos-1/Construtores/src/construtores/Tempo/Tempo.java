package construtores.Tempo;

/**
 *
 * @author lucasmc64
 */

public class Tempo {
    private int hora;
    private int minuto;
    private int segundo;
    
    public Tempo(int h, int m, int s) {
        if(h >= 0 && h <= 23) 
            hora = h;
        else 
            hora = 0;
        
        if(m >= 0 && m <= 59) 
            minuto = m;
        else 
            minuto = 0;
        
        if(s >= 0 && s <= 59) 
            segundo = s;
        else
            segundo = 0;
    }
    
    public String getHora24() {
        return (hora < 10 ? "0" : "") + hora + ":" + (minuto < 10 ? "0" : "") + minuto + ":" + (segundo < 10 ? "0" : "") + segundo;
    }
    
    public String getHora12() {
        int horaConvertida = hora % 12;
        return (horaConvertida < 10 ? "0" : "") + horaConvertida + ":" + (minuto < 10 ? "0" : "") + minuto + ":" + (segundo < 10 ? "0" : "") + segundo + " " + (horaConvertida == hora ? "AM" : "PM");
    }
    
    public void incMinuto() {
        if(minuto + 1 >= 60) {
            minuto = 0;
            
            if(hora + 1 >= 24) {
                hora = 0;
            } else {
                hora++;
            }
        } else {
            minuto++;
        }
    }
    
    public void decMinuto() {
        if(minuto - 1 < 0) {
            minuto = 59;
            
            if(hora - 1 < 0) {
                hora = 23;
            } else {
                hora--;
            }
        } else {
            minuto--;
        }
    }
}
