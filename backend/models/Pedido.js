const { DataTypes } = require('sequelize');
const db = require('../config/db');

const Pedido = db.define('pedidos', {
  fecha_pedido: {
    type: DataTypes.DATE,
    defaultValue: DataTypes.NOW
  },
  total: {
    type: DataTypes.DECIMAL(10, 2),
    allowNull: false
  }
});

module.exports = Pedido;