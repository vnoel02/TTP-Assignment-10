// importing pool
const pool = require("./db");

const express = require("express");
const app = express();

app.use(express.json());

// GET - Receive player data
app.get("/players", async (req, res) => {
  try {
    const results = await pool.query("SELECT * FROM players");
    console.log("Doing GET");
    res.json(results.rows);
  } catch (error) {
    console.error(error);
  }
});

//POST - Add a row of data to the players table

app.post("/players", async (req, res) => {
  try {
    const { player_name, rank, level_name } = req.body;
    console.log("DOING POST");
    const update = await pool.query(
      "INSERT INTO players (player_name, rank, level_name) values ($1, $2, $3) returning *",
      [player_name, rank, level_name]
    );
    res.json(update.rows[0]);
  } catch (error) {
    console.error(error);
  }
});

// Run server
const PORT = 3000;
app.listen(PORT, () => {
  console.log("server has started on port 3000");
});
