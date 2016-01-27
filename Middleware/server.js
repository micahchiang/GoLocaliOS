var express = require('express');
var path = require('path');
var app = express();
var bodyparser = require('body-parser');
app.use(bodyparser.json({extended: true}));
app.use(express.static(path.join(__dirname, './client')));
require('./config/mongoose.js');
require('./config/routes.js')(app);
app.listen(8000, function() {
  console.log('iNode on: 8000');
});
