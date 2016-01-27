var mongoose = require('mongoose');
var UserSchema = new mongoose.Schema({
	firstName: String,
	lastName: String,
	emailAddress: String,
	password: String
});
mongoose.model("User", UserSchema)