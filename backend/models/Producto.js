const { DataTypes } = require('sequelize');
const db = require('../config/db');

const Producto = db.define('productos', {
  nombre: {
    type: DataTypes.STRING(100),
    allowNull: false
  },
  descripcion: {
    type: DataTypes.TEXT,
    allowNull: true
  },
  precio: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  }
});

module.exports = Producto;