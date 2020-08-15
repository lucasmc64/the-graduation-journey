#include <stdio.h>
#include <math.h>
#include <stdlib.h>
#include <windows.h>
#include <gl/gl.h>
#include "SOIL.h"
#include "space.h"

#define bloco 70
#define N 20
#define TAM 0.1f
#define MAT2X(j) ((j)*0.1f-1)
#define MAT2Y(i) (0.9-(i)*0.1f)

struct TPacman{
    int status;
    int xi,yi,x,y;
    int direcao,passo,parcial;
    int pontos;
    int invencivel;
    int vivo;
    int animacao;
};

struct TPhantom{
    int status;
    int xi,yi,x,y;
    int direcao,passo,parcial;
	int decidiu_cruzamento,iniciou_volta;
	int indice_atual;
	int *caminho;
};

struct TCenario{
    int mapa[N][N];
    int NV;
};
//+=+=+=+=+=+=+=+=+=+=+=+=+=+=+ TEXTURAS +=+=+=+=+=+=+=+=+=+=+=+=+=+=+
GLuint naveText2d;
GLuint inimigoText2d[3];
GLuint morteText2d[3];

static GLuint carregaArqTextura(char *str);

void carregaTexturas(){
    int i;
    char str[50];

    sprintf(str,".//Sprites//nave.png");
    naveText2d = carregaArqTextura(str);

    for(i=0; i<3; i++){
        sprintf(str,".//Sprites//inimigo%d.png",i);
        inimigoText2d[i] = carregaArqTextura(str);
    }

    for(i=0; i<3; i++){
        sprintf(str,".//Sprites//morte%d.png",i);
        morteText2d[i] = carregaArqTextura(str);
    }

}

static GLuint carregaArqTextura(char *str){
    // http://www.lonesock.net/soil.html
    GLuint tex = SOIL_load_OGL_texture
        (
            str,
            SOIL_LOAD_AUTO,
            SOIL_CREATE_NEW_ID,
            SOIL_FLAG_MIPMAPS | SOIL_FLAG_INVERT_Y |
            SOIL_FLAG_NTSC_SAFE_RGB | SOIL_FLAG_COMPRESS_TO_DXT
        );

    /* check for an error during the load process */
    if(0 == tex){
        printf( "SOIL loading error: '%s'\n", SOIL_last_result() );
    }

    return tex;
}


