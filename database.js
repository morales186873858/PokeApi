const mysql = require('mysql2');

// Crear una conexión
const connection = mysql.createConnection({
  host: 'localhost', // Cambia esto si tu base de datos está en otro servidor
  user: 'root', // Tu usuario de MySQL
  password: '', // Tu contraseña de MySQL
  database: 'pokedex' // El nombre de tu base de datos
});

// Conectar a la base de datos
connection.connect((err) => {
  if (err) {
    console.error('Error de conexión: ' + err.stack);
    return;
  }
  console.log('Conectado a la base de datos como ID ' + connection.threadId);
});

// Exportar la conexión
module.exports = connection;
