const { Pool } = require('pg');

const pool = new Pool({
    user: 'jordan',
    host: 'db',
    database: 'Tienda_AIDA',
    password: 'jordan',
    port: 5432,
});

module.exports = pool;
