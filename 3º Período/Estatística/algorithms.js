/* +=+ Códigos "Globais" +=+ */

function orderData(data) {
    data.sort(
        function compare(a, b) {
            return a - b;
        }
    );

    return data;
}

function removesRepeatedValues(data) {
    let reduced_data = data.filter(function(item, i) {
        return data.indexOf(item) === i;
    })

    return reduced_data;
}


/* +=-=+ Capítulo 1 +=-=+ */

function frequenciesElement(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency) {
    this.absolute_frequency = absolute_frequency;
    this.relative_frequency = relative_frequency;
    this.percentage_frequency = percentage_frequency;
    this.cumulative_frequency = cumulative_frequency;
    this.cumulative_percentage_frequency = cumulative_percentage_frequency;
}

/* +=+ Dados Qualitativos - Tabela de Frequências +=+ */

function qualitativeFrequencies(data) {
    console.log(`\n\n`);

    let ordered_data = orderData(data);

    let results = {};
    let number_of_observations = ordered_data.length;
    let reduced_observations = removesRepeatedValues(ordered_data);

    let cumulative_frequency = 0, cumulative_percentage_frequency = 0;
    for(let i = 0; i < reduced_observations.length; i++) {
        let absolute_frequency = 0;

        let index = ordered_data.indexOf(reduced_observations[i]);
        while(ordered_data[index] == reduced_observations[i]) {
            absolute_frequency++;
            index++;
        }

        let relative_frequency = Math.round(absolute_frequency * 100 / number_of_observations) / 100;
        let percentage_frequency = relative_frequency * 100;
        
        cumulative_frequency += absolute_frequency;
        cumulative_percentage_frequency = Math.round(cumulative_frequency * 100 / number_of_observations);

        results[reduced_observations[i]] = new frequenciesElement(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency);
    }

    results['total'] = new frequenciesElement(number_of_observations, 1.0, 100, '-', '-');

    return results;
}

// console.table(qualitativeFrequencies([6.94, 8.56, 9.55, 10.14, 10.88, 7.27, 8.66, 9.76, 10.19, 11.16, 7.46, 8.88, 9.80, 10.42, 11.80, 7.97, 8.95, 9.82, 10.44, 11.88, 8.03, 9.30, 9.98, 10.66, 12.25, 8.37, 9.33, 9.99, 10.88, 12.34])); // Aqui entra um array com todos as observações
// console.log(`\n\n`);

/* +=+ Dados Quantitativos - Tabela de Frequências +=+ */

function quantitativeFrequencies(data) {
    console.log(`\n\n`);

    let number_of_classes = Math.round(Math.sqrt(data.length));
    console.log(`Número de classes (k): ${number_of_classes}`);

    let ordered_data = orderData(data);

    let min = ordered_data[0];
    console.log(`Menor valor (Min): ${min}`);
    let max = ordered_data[ordered_data.length - 1];
    console.log(`Maior valor (Max): ${max}`);
    
    let amplitude = +(max - min).toFixed(2);
    console.log(`Amplitude (A): ${amplitude}`);
    
    let class_amplitude = +(amplitude / (number_of_classes - 1)).toFixed(2);
    console.log(`Amplitude de classe (c): ${class_amplitude}`);
    
    let inferior_limit = +(min - (class_amplitude / 2)).toFixed(2);
    console.log(`Limite inferior (LI1): ${inferior_limit}`);

    let results = {};
    let number_of_observations = ordered_data.length;

    let cumulative_frequency = 0, cumulative_percentage_frequency = 0;
    for(let i = 0; i < number_of_classes; i++) {
        let absolute_frequency = 0;
        
        let current_class = `${inferior_limit} |- ${+(inferior_limit + class_amplitude).toFixed(2)}`
        let upper_limit = +(inferior_limit + class_amplitude).toFixed(2);

        absolute_frequency = ordered_data.filter((item, i) => {
            return inferior_limit <= item && item < upper_limit;
        }).length;
        
        let relative_frequency = Math.round(absolute_frequency * 100 / number_of_observations) / 100;
        let percentage_frequency = relative_frequency * 100;
        
        cumulative_frequency += absolute_frequency;
        cumulative_percentage_frequency = Math.round(cumulative_frequency * 100 / number_of_observations);

        inferior_limit = upper_limit;

        results[current_class] = new frequenciesElement(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency);
    }

    results['total'] = new frequenciesElement(number_of_observations, 1.0, 100, '-', '-');

    return results;
}

// console.table(quantitativeFrequencies([6.94, 8.56, 9.55, 10.14, 10.88, 7.27, 8.66, 9.76, 10.19, 11.16, 7.46, 8.88, 9.80, 10.42, 11.80, 7.97, 8.95, 9.82, 10.44, 11.88, 8.03, 9.30, 9.98, 10.66, 12.25, 8.37, 9.33, 9.99, 10.88, 12.34]));
// console.log(`\n\n`);


/* +=-=+ Capítulo 2 +=-=+ */

function arithmeticAverageElement(value, average, detour) {
    this.value = value;
    this.average = average;
    this.detour = detour;
}

function vogueElement(value, count) {
    this.value = value;
    this.count = count;
}

/* +=+ Média Aritmética +=+ */

function arithmeticAverage(data) {
    console.log(`\n\n`);
    
    data.sort(
        function compare(a, b) {
            return a - b;
        }
    );

    let sum = data.reduce(function(accumulator, current_value) {
        return accumulator += current_value;
    }, 0)

    let average = sum / data.length;

    let results = data.map(function(value) {
        return new arithmeticAverageElement(value, average, value - average);
    })

    return {average, results};
}

// console.table(arithmeticAverage([612, 983, 623, 883, 666 , 970]).results);
// console.log(`\n\n`);

/* +=+ Mediana +=+ */

function median(data) {
    let ordered_data = orderData(data);
    let middle_position = ordered_data.length / 2;
    let result;

    if(ordered_data.length % 2 == 0) {
        result = (ordered_data[middle_position] + ordered_data[middle_position - 1]) / 2;
    } else {
        result = ordered_data[Math.floor(middle_position)];
    }

    return result;
}

// console.log(median([1, 3, 8, 6, 2, 4]));
// console.log(`\n\n`);

/* +=+ Moda +=+ */

function vogue(data) {
    console.log(`\n\n`);

    let ordered_data = orderData(data);
    let reduced_data = removesRepeatedValues(data);
    let results = [];

    for(let i = 0; i < reduced_data.length; i++) {
        let value_position = ordered_data.indexOf(reduced_data[i]);
        let value_count = 0;

        while(reduced_data[i] == ordered_data[value_position]) {
            value_count++;
            value_position++;
        }

        results.push(new vogueElement(reduced_data[i], value_count));
    }

    let bigger_count = results[0].count;

    results.forEach(function(item) {
        if(item.count > bigger_count) bigger_count = item.count;
    })

    if(bigger_count > 1) {
        results = results.filter(function(item, i) {
            return item.count === bigger_count;
        })
    } else {
        console.log(`Amostra amodal (não possui moda)`);
        return [];
    }

    results.length == 1 ? console.log(`Amostra unimodal`) : (results.length == 2 ? console.log(`Amostra bimodal`) : console.log(`Amostra multimodal`))
    
    return results;
}

// console.table(vogue([7 , 8 , 9 , 2, 2, 2, 10 , 10 , 10 , 11 , 12]));
// console.log(`\n\n`);

/* +=+ Análise de Simetria entre Média, Mediana e Moda +=+ */

function symmetry(data) {
    let average_result = arithmeticAverage(data);
    let median_result = median(data);
    let vogue_result = vogue(data);

    if(average_result.average == median_result && median_result == vogue_result[0].value) {
        console.log(`Média (${average_result.average}) == Mediana (${median_result}) == Moda (${median_result}) -> Distribuição simétrica`);
    } else if(average_result.average >= median_result && median_result >= vogue_result[0].value) {
        console.log(`Média (${average_result.average}) >= Mediana (${median_result}) >= Moda (${median_result}) -> Distribuição assimétrica à direita`);
    } else {
        console.log(`Média (${average_result.average}) <= Mediana (${median_result}) <= Moda (${median_result}) -> Distribuição assimétrica à esquerda`);
    }
}

// symmetry([10 , 10 , 10, 100]);
// console.log(`\n\n`);

/* +=+ Quartis +=+ */

function quarter(data) {
    let ordered_data = orderData(data);

    let first_quarter = Math.round((1 * (ordered_data.length + 1)) / 4);
    let second_quarter = median(ordered_data);
    let third_quarter = Math.round((3 * (ordered_data.length + 1)) / 4);

    console.log(`Primeiro quartil (EQ1): ${first_quarter}º elemento, ${ordered_data[first_quarter - 1]}`);
    console.log(`Segundo quartil (EQ2): ${second_quarter}º elemento, ${second_quarter}`);
    console.log(`Terceiro quartil (EQ3): ${third_quarter}º elemento, ${ordered_data[third_quarter - 1]}`);

    return {first_quarter, second_quarter, third_quarter};
}

// quarter([2, 5, 6, 9, 10, 13, 15]);

/* +=+ Percentil +=+ */

function percentile(data, percentage) {
    let ordered_data = orderData(data);

    let percentile_result = (percentage * (ordered_data.length + 1)) / 100;

    console.log(`Percentil ${percentage} (EP${percentage}): ${percentile_result}º elemento (${ordered_data[percentile_result - 1]})`);
}

// percentile([2, 5, 6, 9, 10, 13, 15], 50);

/* +=+ Boxplot +=+ */

function boxplot(data) {
    let quarters = quarter(data);
    console.log(`\n\n`);
    let dq = data[quarters.third_quarter - 1] - data[quarters.first_quarter - 1];
    let inferior_limit = data[quarters.first_quarter - 1] - 1.5 * dq;
    let upper_limit = data[quarters.third_quarter - 1] + 1.5 * dq;
    let values_above = data.filter(function(value) {
        return value > upper_limit;
    });
    let values_below = data.filter(function(value) {
        return value < inferior_limit;
    });

    (data[quarters.third_quarter - 1] - quarters.second_quarter == quarters.second_quarter - data[quarters.first_quarter - 1]) ? console.log(`Distribuição simétrica`) : ((data[quarters.third_quarter - 1] - quarters.second_quarter > quarters.second_quarter - data[quarters.first_quarter - 1]) ? console.log(`Distribuição assimétrica positiva (Q2 mais próximo do Q1)`) : console.log(`Distribuição assimétrica negativa (Q2 mais próximo do Q3)`));

    console.log(`Valores acima do limite superior: ${values_above}`);
    console.log(`Limite superior (LS): ${upper_limit}`);
    console.log(`Terceiro quartil (Q3): ${data[quarters.third_quarter - 1]}`);
    console.log(`Segundo quartil ou mediana (Q2): ${quarters.second_quarter}`);
    console.log(`Primeiro quartil (Q1): ${data[quarters.first_quarter - 1]}`);
    console.log(`Limite inferior (LI): ${inferior_limit}`);
    console.log(`Valores abaixo do limite inferior: ${values_below}`);
}

// boxplot([25, 28, 29, 29, 30, 34, 35, 35, 37, 38]);


/* +=-=+ Capítulo 3 +=-=+ */

/* +=+ Variância e Desvio Padrão +=+ */

function variance(data) {
    let average = arithmeticAverage(data);

    let variance_sum = average.results.reduce(function(accumulator, current_item) {
        return accumulator + Math.pow(current_item.detour - average.average, 2);
    }, 0)

    return Math.round(variance_sum * 100 / data.length) / 100;
}

// console.log(variance([187, 183, 185]));

function standardDetour(data) {
    let variance_result = variance(data);

    return Math.round(Math.sqrt(variance_result) * 100) / 100;
}

// console.log(standardDetour([187, 183, 185]));