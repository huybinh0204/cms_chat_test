var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function(req, res, next) {

        res.render('admin/index', { title: 'Admin' });
        // res.json(rows)
});
router.post('/', function (req, res, next) {
    var username = req.body.username;
    var password = req.body.password;

    var sql = `SELECT username , password FROM admin WHERE username="${username}" and password ="${password}"`;
    db.query(sql, function(err,rows, result) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }else {
            var  a = rows[0];
             if (username == '' && password == ''){
                 res.render('index', { title: 'Bạn chưa nhập thông tin Username & Password' });
            }else {
                 if (username== a.username  && password == a.password ){
                         res.render('admin/index', { title: 'Admin' });
                         // res.json(rows)
                 }else{
                     if (username=='' || password == ''){
                         res.render('index', { title: 'Bạn chưa nhập Username hoặc Password !' });
                     }else{
                         res.render('index', { title: 'Bạn nhập Username hoặc Password bi sai!' });
                     }
                 }
            }
        }

    })

});

module.exports = router;
