const express = require("express");
const axios = require("axios");
const app = express();

app.set("view engine", "pug");

app.get("/", async (req, res) => {
  const query = await axios.get("https://randomuser.me/api/?results=9");
  res.render("index", { users: query.data.results });
});

const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Listening on port ${PORT}...`);
});