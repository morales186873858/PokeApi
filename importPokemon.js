const axios = require('axios');
const mysql = require('mysql2');

// Configuración de la conexión a la base de datos
const connection = mysql.createConnection({
  host: 'localhost', // Cambia esto si tu base de datos está en otro servidor
  user: 'root', // Tu usuario de MySQL
  password: '', // Tu contraseña de MySQL
  database: 'pokedex' // El nombre de tu base de datos
});

// Importa los primeros 150 ids de pokemon a la base de datos. Usar
// la API de https://pokeapi.co para extraer la información

//Tabla 
// CREATE TABLE pokemon (
//   id INT PRIMARY KEY,
//   name VARCHAR(50) NOT NULL,
//   base_experience INT,
//   height INT,
//   weight INT,
//   types VARCHAR(100),
//   captured TINYINT(1) DEFAULT 0 
// );

// Función para obtener y guardar los Pokémon
const InsertPokemon = async () => {
  try {
    for (let i = 1; i <= 150; i++) {
      const response = await axios.get(`https://pokeapi.co/api/v2/pokemon/${i}`);
      const pokemon = response.data;

      // Extraer información relevante
      const id = pokemon.id;
      const name = pokemon.name;
      const baseExperience = pokemon.base_experience;
      const height = pokemon.height;
      const weight = pokemon.weight;
      const types = pokemon.types.map(type => type.type.name).join(', ');

      // Insertar en la base de datos
      const query = `
        INSERT INTO pokemon (id, name, base_experience, height, weight, types) 
        VALUES (?, ?, ?, ?, ?, ?)
      `;

      connection.query(query, [id, name, baseExperience, height, weight, types], (error) => {
        if (error) {
          console.error('Error al insertar el Pokémon:', error);
        } else {
          console.log(`Pokémon ${name} insertado correctamente`);
        }
      });
    }
  } catch (error) {
    console.error('Error al obtener la información de la API:', error);
  } finally {
    connection.end();
  }
};

// Ejecutar la función
InsertPokemon();
