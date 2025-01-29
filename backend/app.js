require('dotenv').config(); 
const express = require('express');
const db = require('./config/db');
const apiRoutes = require('./routes/api');

const app = express();
const PORT = process.env.PORT || 5000;

app.use(express.json());
app.use('/api', apiRoutes);

db.authenticate()
  .then(() => console.log('Conexión a la base de datos establecida...'))
  .catch(err => console.error('No se pudo conectar a la base de datos:', err));

app.listen(PORT, () => console.log(`Servidor corriendo en el puerto ${PORT}`));
