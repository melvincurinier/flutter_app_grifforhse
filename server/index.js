const express = require("express");
const mongoose = require("mongoose");
const authRouter = require("./routes/auth");

const PORT = process.env.PORT || 3000;
const app = express();

app.use(express.json());
app.use(authRouter);

const db = "mongodb+srv://melvincurinier:Bk1LSaiSnUIGN7YI@bddmdl.cfed4j1.mongodb.net/?retryWrites=true&w=majority";

mongoose
    .connect(db)
    .then(() => {
        console.log('La connexion est un succès');
    })
    .catch((error) =>{
        console.log(error);
    });

app.listen(PORT, "0.0.0.0", () => {
    console.log(`Serveur sur le port ${PORT}`);
});