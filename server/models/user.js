const mongoose = require("mongoose");

const userScheme = mongoose.Schema({
    name: {
        required: true,
        type: String,
        trim: true
    },
    email: {
        required: true,
        type: String,
        trim: true,
        validate: {
            validator: (value) => {
                const regex =
                    /^(([^<>()[\]\.,;:\s@\"]+(\.[^<>()[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i;
                return value.match(regex);
            },
            message: 'Veuillez entrer une adresse mail valide.'
        }
    },
    password: {
        required: true,
        type: String,
        validate:{
            validator: (value) =>{
                return value.length > 6;
            },
            message: 'Veuillez entrer un mot de passe plus long.'
        }
    }
});

const User = mongoose.model('User', userScheme);
module.exports = User;
