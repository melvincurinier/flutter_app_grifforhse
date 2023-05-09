const express = require("express");
const mongoose = require("mongoose");
const PORT = 3000;

const db = "mongodb+srv://melvincurinier:Bk1LSaiSnUIGN7YI@bddmdl.cfed4j1.mongodb.net/?retryWrites=true&w=majority"

const app = express();

mongoose
    .connect(db)
    .then(() => {
        console.log('Connection Succesful');
    })
    .catch((error) =>{
        console.log(error);
    });

app.listen(PORT, () => {
    console.log(`Server running on port ${PORT}`);
});