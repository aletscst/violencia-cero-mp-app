final String generalPath = 'http://192.168.0.17:3000';

final List<int> ages = _getAges();

final List<String> scolarships = [
  'Ninguna',
  'Primaria',
  'Secundaria',
  'Media Superior',
  'Superior',
  'Otro',
];

final List<String> maritaStatus = [
  'Soltera(o)',
  'Casada(o)',
  'Divorciada(o)',
  'Vuida(o)',
  'Otro',
];

final List<String> relationship = [
  'Padre',
  'Hermano',
  'Abuelo',
  'Tio',
  'Primo',
  'Otro',
];

final List<String> states = [
  'Aguascalientes',
  'Baja California',
  'Baja California Sur',
  'Campeche',
  'CDMX',
  'Chiapas',
  'Chihuahua',
  'Ciudad de México',
  'Coahuila',
  'Colima',
  'Durango',
  'Estado de México',
  'Guanajuato',
  'Guerrero',
  'Hidalgo',
  'Jalisco',
  'Michoacán',
  'Morelos',
  'Nayarit',
  'Nuevo León',
  'Oaxaca',
  'Puebla',
  'Querétaro',
  'Quintana Roo',
  'San Luis Potosí',
  'Sinaloa',
  'Sonora',
  'Tabasco',
  'Tamaulipas',
  'Tlaxcala',
  'Veracruz',
  'Yucatán',
  'Zacatecas',
];

List<int> _getAges() {
  List<int> ages = new List<int>();

  for (var i = 1; i < 100; i++) {
    ages.add(i);
  }

  return ages;
}
