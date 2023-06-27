// Imports Pool and connects to database
const {Pool} = require('pg');

const pool = new Pool({
    user: "victornoel",
    password: "",
    host: "localhost",
    port: 5432,
    database: "gamedb"
})

// Exports the pool to be used in index.js
module.exports = pool;