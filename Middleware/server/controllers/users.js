var mongoose = require('mongoose')
var User = mongoose.model('User');
module.exports = (function(){
	return {
		create: function(req, res){
			console.log("in MEAN controller", req.body);
			var user = new User(req.body);
			user.save(function(err){
				if(err){
					console.log(err);
				}
				else {
					User.find({}, function(err, results){
						if(err){
							console.log(err);
						}
						else {
							res.json(results)
						}
					})
				}
			})
		}, //end of create function

		login: function(req, res){
			console.log("in MEAN Controller LOGIN", req.body);
			User.findOne({emailAddress: req.body.email}, function(err, user){
				if(!user){
					console.log("user does not exist");
				}
				else {
					res.json(user);
				}
			})
		}
	}
})();