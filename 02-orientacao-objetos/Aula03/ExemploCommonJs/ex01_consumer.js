const circulo = require('./ex01_provider.js');
console.log(`Área do círculo de raio 4 é ${circulo.area(4)}`);

const {area} = require('./ex01_provider.js');
console.log(`Área do círculo de raio 2 é ${area(2)}`);