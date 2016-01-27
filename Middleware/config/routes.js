var users = require('./../server/controllers/users.js');
module.exports = function(app) {
  app.post('/login', function(req, res) {
  	console.log("IN MEAN ROUTE FOR LOGIN", req.body);
    users.login(req, res);
  });
  app.post('/users', function(req, res){
  	console.log("IN MEAN ROUTE", req.body);
  	users.create(req, res);
  })
}
