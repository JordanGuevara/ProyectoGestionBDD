const express = require('express');
const { Pool } = require('pg');
const bodyParser = require('body-parser');

// Crear la aplicación Express
const app = express();
const port = 3000;

// Configuración de la base de datos
const pool = new Pool({
    user: 'jordan',
    host: 'db', 
    database: 'Tienda_AIDA',
    password: 'jordan',
    port: 5432,
});

// Middleware
app.use(bodyParser.json());
app.get('/', (req, res) => {
    res.send('Bienvenido a la API de la Tienda AIDA');
});

// Obtener todos los usuarios (con todos los campos)
app.get('/usuarios', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM usuarios');
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al obtener usuarios');
    }
});

// Obtener todos los productos (con todos los campos)
app.get('/productos', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM productos');
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al obtener productos');
    }
});

// Obtener todos los pedidos (con todos los campos)
app.get('/pedidos', async (req, res) => {
    try {
        const result = await pool.query('SELECT * FROM pedidos');
        res.json(result.rows);
    } catch (err) {
        console.error(err);
        res.status(500).send('Error al obtener pedidos');
    }
});


// Iniciar el servidor
app.listen(port, () => {
    console.log(`Servidor backend corriendo en http://localhost:${port}`);
});
