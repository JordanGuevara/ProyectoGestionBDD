const { DataTypes } = require('sequelize');
const db = require('../config/db');

const Categoria = db.define('categorias', {
  nombre: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: true
  }
});

module.exports = Categoria;