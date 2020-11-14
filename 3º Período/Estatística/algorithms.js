/* +=-=+ Capítulo 1 +=-=+ */

/* +=+ Dados Qualitativos - Tabela de Frequências +=+ */

function Element(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency) {
    this.absolute_frequency = absolute_frequency;
    this.relative_frequency = relative_frequency;
    this.percentage_frequency = percentage_frequency;
    this.cumulative_frequency = cumulative_frequency;
    this.cumulative_percentage_frequency = cumulative_percentage_frequency;
}

function qualitativeFrequencies(observations) {
    observations.sort(
        function compare(a, b) {
            return a - b;
        }
    );

    let results = {};
    let number_of_observations = observations.length;
    let reduced_observations = observations.filter(function(item, i) {
        return observations.indexOf(item) === i;
    });

    let cumulative_frequency = 0, cumulative_percentage_frequency = 0;
    for(let i = 0; i < reduced_observations.length; i++) {
        let absolute_frequency = 0;

        let index = observations.indexOf(reduced_observations[i]);
        while(observations[index] == reduced_observations[i]) {
            absolute_frequency++;
            index++;
        }

        let relative_frequency = absolute_frequency / number_of_observations;
        let percentage_frequency = relative_frequency * 100;
    
        cumulative_frequency += absolute_frequency;
        cumulative_percentage_frequency += percentage_frequency;
        results[reduced_observations[i]] = new Element(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency);
    }

    results['total'] = new Element(number_of_observations, 1.0, 100, '-', '-');

    return results;
}

// console.table(qualitativeFrequencies([1,1,1,2,5])); // Aqui entra um array com todos as observações

/* +=+ Dados Quantitativos - Tabela de Frequências +=+ */

function quantitativeFrequencies(observations) {
    console.log(`\n\n`);

    let number_of_classes = Math.round(Math.sqrt(observations.length));
    console.log(`Número de classes (k): ${number_of_classes}`);

    observations.sort(
        function compare(a, b) {
            return a - b;
        }
    );

    let min = observations[0];
    console.log(`Menor valor (Min): ${min}`);
    let max = observations[observations.length - 1];
    console.log(`Maior valor (Max): ${max}`);
    
    let amplitude = +(max - min).toFixed(2);
    console.log(`Amplitude (A): ${amplitude}`);
    
    let class_amplitude = +(amplitude / (number_of_classes - 1)).toFixed(2);
    console.log(`Amplitude de classe (c): ${class_amplitude}`);
    
    let inferior_limit = +(min - (class_amplitude / 2)).toFixed(2);
    console.log(`Limite inferior (LI1): ${inferior_limit}`);

    let results = {};
    let number_of_observations = observations.length;

    let cumulative_frequency = 0, cumulative_percentage_frequency = 0;
    for(let i = 0; i < number_of_classes; i++) {
        let absolute_frequency = 0;
        
        let current_class = `${inferior_limit} |- ${+(inferior_limit + class_amplitude).toFixed(2)}`
        let upper_limit = +(inferior_limit + class_amplitude).toFixed(2);

        absolute_frequency = observations.filter((item, i) => {
            return inferior_limit <= item && item < upper_limit;
        }).length;
        
        let relative_frequency = Math.round(absolute_frequency * 100 / number_of_observations) / 100;
        let percentage_frequency = relative_frequency * 100;
        
        cumulative_frequency += absolute_frequency;
        cumulative_percentage_frequency = Math.round(cumulative_frequency * 100 / number_of_observations) ;

        inferior_limit = upper_limit;

        results[current_class] = new Element(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency);
    }

    results['total'] = new Element(number_of_observations, 1.0, 100, '-', '-');

    return results;
}

console.table(quantitativeFrequencies([6.94, 8.56, 9.55, 10.14, 10.88, 7.27, 8.66, 9.76, 10.19, 11.16, 7.46, 8.88, 9.80, 10.42, 11.80, 7.97, 8.95, 9.82, 10.44, 11.88, 8.03, 9.30, 9.98, 10.66, 12.25, 8.37, 9.33, 9.99, 10.88, 12.34]));

/* +=-=+ Capítulo 2 +=-=+ */

/* +=+ Média Aritmética +=+ */

function arithmeticAverage(data) {
    let sum = data.reduce(function(accumulator, current_value) {
        return accumulator += current_value;
    }, 0)

    let result = sum / data.length;

    return result;
}

//console.log(arithmeticAverage([1,1,1,2,5]));

