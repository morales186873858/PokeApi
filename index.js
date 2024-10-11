const express = require('express');
const connection = require('./database'); // Importar la conexión
const cors = require('cors');

const app = express();
const PORT = 3000;

//Middleware para parsear el cuerpo de las solicitudes
app.use(express.json());
app.use(cors()); // Habilita CORS para todas las rutas

// Función para capturar el Pokémon
function capturePokemon(id, res) {
  connection.query('UPDATE pokemon SET captured = 1 WHERE id = ?', [id], (err, result) => {
    if (err) {
      console.error(`Error al actualizar el estado del Pokémon con ID ${id}: ${err}`);
      return res.status(500).json({ error: 'Error al capturar Pokémon' });
    }

    // Verifica si se actualizó algún registro
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Pokémon no encontrado' });
    }

    // Obtener los detalles del Pokémon actualizado
    connection.query('SELECT * FROM pokemon WHERE id = ?', [id], (err, rows) => {
      if (err) {
        console.error(`Error al obtener los detalles del Pokémon con ID ${id}: ${err}`);
        return res.status(500).json({ error: 'Error al obtener detalles del Pokémon' });
      }

      if (rows.length === 0) {
        return res.status(404).json({ error: 'Pokémon no encontrado' });
      }

      const pokemonCapturado = rows[0]; // Obtener el primer (y único) resultado

      res.status(201).json({
        message: 'Pokémon capturado exitosamente',
        id: pokemonCapturado.id,
        pokemon: pokemonCapturado.name,
        tipo: pokemonCapturado.type,
        captured: 1,
      });
    });
  });
}
//enpoint para capturar  http://localhost:3000/api/pokemons/capturar/1
app.get('/api/pokemons/capturar/:id', (req, res) => {
  const { id } = req.params; // Captura el ID del Pokémon de los parámetros de la URL

  // Verificar que se envía el ID
  if (!id) {
    return res.status(400).json({ error: 'Falta el ID del Pokémon' });
  }

  // Verificar cuántos Pokémon están capturados actualmente
  connection.query('SELECT * FROM pokemon WHERE captured = 1', (err, capturedPokemons) => {
    if (err) {
      console.error(`Error al obtener los Pokémon capturados: ${err}`);
      return res.status(500).json({ error: 'Error al verificar Pokémon capturados' });
    }

    // Si ya hay 6 Pokémon capturados, liberar el primero
    if (capturedPokemons.length == 6) {
      const pokemonToRelease = capturedPokemons[0]; // El primer Pokémon capturado

      connection.query('UPDATE pokemon SET captured = 0 WHERE id = ?', [pokemonToRelease.id], (err, result) => {
        if (err) {
          console.error(`Error al liberar el Pokémon con ID ${pokemonToRelease.id}: ${err}`);
          return res.status(500).json({ error: 'Error al liberar Pokémon' });
        }

        // Capturar el nuevo Pokémon después de liberar uno
        capturePokemon(id, res);
      });
    } else {
      // Si hay menos de 6 Pokémon capturados, capturar directamente
      capturePokemon(id, res);
    }
  });
});

//Obtener los Pokémon capturados    http://localhost:3000/api/pokemons/captured
app.get('/api/pokemons/captured', (req, res) => {
  const query = 'SELECT id, name, types, captured FROM pokemon WHERE captured = 1';

  connection.query(query, (error, results) => {
    if (error) {
      return res.status(500).json({ error: 'Error al obtener los Pokémon capturados' });
    }
    const response = {
      PokemonCapturado: results.map(pokemon => ({
        id: pokemon.id,
        pokemon: pokemon.name,
        tipo: pokemon.types,
        capturado: pokemon.captured,
      }))
    };

    res.json(response);
  });
});

//Endpoint para Filtrar  api/pokemons?name=ditto&type=fire&limit=20&page=1 
//Si quiere buscar solamente pokemones api/pokemons?name=ditto
app.get('/api/pokemons', (req, res) => {
  const limit = parseInt(req.query.limit) || 20; // Número de Pokémon por página
  const page = parseInt(req.query.page) || 1; // Página actual
  const offset = (page - 1) * limit;

  // Filtros
  const nameFilter = req.query.name ? connection.escape(`%${req.query.name}%`) : '1'; // Filtro por nombre
  const typeFilter = req.query.type ? connection.escape(`%${req.query.type}%`) : '1'; // Filtro por tipo

  // Contar el total de Pokémon en la base de datos con filtros
  const countQuery = `
    SELECT COUNT(*) AS total FROM pokemon 
    WHERE (name LIKE ${nameFilter} OR types LIKE ${typeFilter})
  `;
  connection.query(countQuery, (countError, countResult) => {
    if (countError) {
      return res.status(500).json({ error: 'Error al contar los Pokémon' });
    }

    const totalPokemons = countResult[0].total;
    const totalPages = Math.ceil(totalPokemons / limit);

    // Obtener los Pokémon con paginación y filtros
    const query = `
      SELECT id, name, types, captured 
      FROM pokemon 
      WHERE (name LIKE ${nameFilter} OR types LIKE ${typeFilter}) 
      LIMIT ? OFFSET ?
    `;
    connection.query(query, [limit, offset], (error, results) => {
      if (error) {
        return res.status(500).json({ error: 'Error al obtener los Pokémon' });
      }

      // Formatear la respuesta con los datos necesarios
      const response = {
        totalPokemons,
        totalPages,
        currentPage: page,
        pokemons: results.map(pokemon => ({
          id: pokemon.id, 
          name: pokemon.name,
          types: pokemon.types.split(', '),
          captured: pokemon.captured // Convierte a un array de tipos
        
        }))
      };

      res.json(response);
    });
  });
});

// Endpoint para obtener todos los Pokémon http://localhost:3000/api/pokemons/all
app.get('/api/pokemons/all', (req, res) => {
  // Consulta para obtener todos los Pokémon
  const query = `
    SELECT id, name, types , captured
    FROM pokemon
  `;

  connection.query(query, (error, results) => {
    if (error) {
      console.error('Error al obtener todos los Pokémon:', error);
      return res.status(500).json({ error: 'Error al obtener todos los Pokémon' });
    }

    // Formatear la respuesta con los datos necesarios
    const response = results.map(pokemon => ({
      id: pokemon.id,
      name: pokemon.name,
      types: pokemon.types.split(', '), // Convierte a un array de tipos
      captured: pokemon.captured,
    }));

    res.json(response);
  });
});

// Endpoint para eliminar un Pokémon http://localhost:3000/api/pokemons/captured/1
app.delete('/api/pokemons/delete/:id', (req, res) => {
  const { id } = req.params; // Captura el ID del Pokémon de los parámetros de la URL

  // Verificar que se envía el ID
  if (!id) {
    return res.status(400).json({ error: 'Falta el ID del Pokémon' });
  }

  // Realiza la consulta para liberar el Pokémon
  const query = 'UPDATE pokemon SET captured = ? WHERE id = ?';
  connection.query(query, [0, id], (err, result) => {
    if (err) {
      console.error(`Error al liberar el Pokémon con ID ${id}:`, err);
      return res.status(500).json({ error: 'Error al liberar Pokémon' });
    }

    // Verifica si se actualizó algún registro
    if (result.affectedRows === 0) {
      return res.status(404).json({ error: 'Pokémon no encontrado' });
    }

    res.status(200).json({
      message: 'Pokémon liberado exitosamente',
      pokemonId: id,
      captured: 0,
    });
  });
});


app.listen(PORT, () => {
  console.log(`Servidor escuchando en http:localhost:${PORT}`);
});
