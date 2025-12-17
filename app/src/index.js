const express = require("express");
const { Client } = require("pg");

const app = express();
const PORT = process.env.PORT || 3000;

// Database config
const dbConfig = {
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASS,
  port: process.env.DB_PORT ? parseInt(process.env.DB_PORT, 10) : 5432,
  database: process.env.DB_NAME,
  ssl: {
  rejectUnauthorized: false
}

};

const client = new Client(dbConfig);

// Connect to PostgreSQL
(async () => {
  try {
    await client.connect();
    console.log("📌 Connected to PostgreSQL RDS successfully!");
  } catch (err) {
    console.error("❌ Failed to connect to DB on startup:", err.message || err);
  }
})();

// Health check
app.get("/health", (req, res) => {
  res.json({ status: "ok" });
});

// Root path
app.get("/", async (req, res) => {
  try {
    const result = await client.query("SELECT NOW()");
    res.send(`App is running! 🎉<br>DB Time: ${result.rows[0].now}`);
  } catch (error) {
    res.status(500).send("DB Error: " + error.message);
  }
});

// DB test route
app.get("/db-check", async (req, res) => {
  try {
    const r = await client.query("SELECT 1 as ok");
    res.json({ ok: r.rows[0].ok });
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

// Start server
app.listen(PORT, () => {
  console.log(`API running on port ${PORT}`);
});
