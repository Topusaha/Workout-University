const mongoose = require('mongoose');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');

// Secret key for JWT signing and encryption
const SECRET_KEY = 'GF567VYGB678GF576B8tb';

const loginSchema = new mongoose.Schema({
    username: {
        type: String,
        required: true,
        unique: true,
        minlength: 3,
        maxlength: 20
    },
    password: {
        type: String,
        required: true,
    },
    email: {
        type: String,
        required: true,
        unique: true,
        lowercase: true,
        trim: true

    },
    token: {
        type: String,
        required: false
    },
    tokenExpire: {
        type: Date,
        required: false
    },
    // Add reset password token and expire date
    resetPasswordToken: {
        type: String,
        required: false
    },
    resetPasswordExpire: {
        type: Date,
        required: false
    }
});

// Method to hash the password
loginSchema.methods.hashPassword = async function () {
    try {
        // Generate a salt
        const salt = await bcrypt.genSalt(10);
        // Generate a password hash (salt + hash)
        const passwordHash = await bcrypt.hash(this.password, salt);
        // Re-assign hashed version over original, plain text password
        this.password = passwordHash;
    } catch (error) {
        throw new Error(error);
    }
}

// Method to check if the password is correct
loginSchema.methods.isValidPassword = async function (newPassword) {
    try {
        return await bcrypt.compare(newPassword, this.password);
    } catch (error) {
        throw new Error(error);
    }
}

// Method to generate an auth token for the user
loginSchema.methods.generateAuthToken = async function () {
    try {
        // Generate an auth token
        const token = jwt.sign({ _id: "this._id" }, SECRET_KEY);
        // Save the auth token
        this.token = token;
        // Save the token expire date
        this.tokenExpire = Date.now() + 3600000;

        // Save the user
        await this.save();

        return token;

    } catch (error) {
        throw new Error(error);
    }
}

// Method to check if the token is valid
loginSchema.methods.isTokenValid = async function () {
    try {
        // Check if the token is not expired
        if (this.tokenExpire > Date.now()) {
            return true;
        }
        return false;
    } catch (error) {
        throw new Error(error);
    }
}

// Method to generate a reset password token
loginSchema.methods.generateResetPasswordToken = async function () {
    try {
        // Generate a reset password token
        const token = jwt.sign({ _id: this._id }, SECRET_KEY, { expiresIn: '1h' });

        // Save the reset password token and its expiration date
        this.resetPasswordToken = token;
        this.resetPasswordTokenExpire = Date.now() + 3600000; // Set the expiration time to 1 hour

        // Save the user
        await this.save();

        return token;
    } catch (error) {
        throw new Error(error);
    }
}

// Method to check if the reset password token is valid
loginSchema.methods.isResetPasswordTokenValid = async function () {
    try {
        // Check if the token is not expired
        if (this.resetPasswordTokenExpire > Date.now()) {
            return true;
        }
        return false;
    } catch (error) {
        throw new Error(error);
    }
}

module.exports = mongoose.model('Login', loginSchema);