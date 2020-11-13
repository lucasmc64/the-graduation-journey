/* +=-=+ Capítulo 1 +=-=+ */

// Dados Qualitativos - Tabela de Frequências

function Element(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency) {
    this.absolute_frequency = absolute_frequency;
    this.relative_frequency = relative_frequency;
    this.percentage_frequency = percentage_frequency;
    this.cumulative_frequency = cumulative_frequency;
    this.cumulative_percentage_frequency = cumulative_percentage_frequency;
}

function qualitativeFrequencies (observations) {
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

// console.log(frequencies([1,1,1,2,5])); // Aqui entra um array com todos as observações

// Dados Quantitativos - Tabela de Frequências

function quantitativeFrequencies (observations) {
    let number_of_classes = Math.sqrt(observations.length);

    observations.sort(
        function compare(a, b) {
            return a - b;
        }
    );

    let min = observations[0];
    let max = observations[observations.length - 1];

    let amplitude = max - min;

    let class_amplitude = amplitude / (number_of_classes - 1);
    
    let inferior_limit = min - (class_amplitude / 2);

    let results = {};
    let number_of_observations = observations.length;

    let cumulative_frequency = 0, cumulative_percentage_frequency = 0;
    for(let i = 0; i < number_of_classes - 1; i++) {
        let absolute_frequency = 0;
        
        let current_class = `${inferior_limit} |- ${inferior_limit + class_amplitude}`
        let upper_limit = inferior_limit + class_amplitude;

        absolute_frequency = observations.filter((item, i) => {
            return inferior_limit <= item && item < upper_limit;
        }).length;

        let relative_frequency = absolute_frequency / number_of_observations;
        let percentage_frequency = relative_frequency * 100;
    
        cumulative_frequency += absolute_frequency;
        cumulative_percentage_frequency += percentage_frequency;

        inferior_limit = upper_limit;

        results[current_class] = new Element(absolute_frequency, relative_frequency, percentage_frequency, cumulative_frequency, cumulative_percentage_frequency);
    }

    results['total'] = new Element(number_of_observations, 1.0, 100, '-', '-');

    return results;
}

console.table(quantitativeFrequencies([1,1,1,2,5]));