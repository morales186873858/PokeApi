# PokeApi
Proyecto pokeapi

EL ARCHIVO SQL ESTA DENTRO DEL PROYECTO PARA IMPORTAR 

Conexion para la base de datos  "PhpMyAdmin" 

const connection = mysql.createConnection({
  host: 'localhost', 
  user: 'root', 
  password: '', 
  database: 'pokedex'
});

Para importa la base de datos esta el archivo ImportPokemon.js

    TABLA PARA LA BASE DE DATOS 

 CREATE TABLE pokemon (
   id INT PRIMARY KEY,
   name VARCHAR(50) NOT NULL,
   base_experience INT,
   height INT,
   weight INT,
   types VARCHAR(100),
   captured TINYINT(1) DEFAULT 0 
 );


 ENDPOINT POR URL

CAPTURAR
http://localhost:3000/api/pokemons/capturar/1

CAPTURADOS
http://localhost:3000/api/pokemons/captured

FILTRO CON PAGINA
http://localhost:3000/api/pokemons?name=ditto&type=fire&limit=20&page=1 


FILTRO CON NOMBRE
http://localhost:3000/api/pokemons?name=ditto

LISTAR TODOS
http://localhost:3000/api/pokemons/all

ELIMINAR 
http://localhost:3000/api/pokemons/delete/1

NPM

npm install
npm install cors
npm install axios mysql   
npm install express      

SUGERENIA
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned

CORRE BACKEND
node. index.js 

CARGAR DATOS
node. importPokemon.js

