const express = require("express");
const User = require("../models/user");

const authRouter = express.Router();

// INSCRIPTION
authRouter.post("/api/signup", async (req, res) => {
    try {
        const { name, email, password } = req.body;

        const existingUser = await User.findOne({ email });
        if (existingUser) {
            return res.status(400).json({ msg: 'Cette adresse mail existe déjà !' });
        }

        let user = new User({
            name,
            email,
            password,
        })
        user = await user.save();
        res.json(user);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
});

// CONNEXION
authRouter.post('/api/signin', async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) {
            return res.status(400).json({ msg: 'L\'tilisateur avec cette adresse mail n\'existe pas !' });
        }
        if (password != user.password) {
            return res.status(400).json({ msg: 'Le mot de passe est incorrect !' });
        }

        res.json(user._doc);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
})

module.exports = authRouter;