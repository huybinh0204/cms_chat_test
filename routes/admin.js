var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function (req, res, next) {

    res.render('admin/index', {title: 'Admin'});
    // res.json(rows)
});
router.post('/', function (req, res, next) {
    var username = req.body.username;
    var password = req.body.password;
    var username_check='';
    var password_check='';
    var sql = `SELECT username , password FROM admin WHERE username="${username}" and password ="${password}"`;
    // db.query(sql, function (err, rows, result) {
    //     if (err) {
    //         res.status(500).send({error: 'Something failed!'})
    //     }
    //     username_check=rows[0].username;
    //     console.log("------");
    //     console.log(username_check);
    //     res.render('admin/index', {title: 'Admin'});
    // })
    if (username == '' && password == '') {
        res.render('index', {title: 'Bạn chưa nhập thông tin Username & Password'});
    } else if (username == '' || password == '') {
        res.render('index', {title: 'Bạn chưa nhập Username hoặc Password !'});
    } else if (username == 'admin' && password == '123456') {
        res.render('admin/index', {title: 'Admin'});
    } else {
        res.render('index', {title: 'Bạn nhập Username hoặc Password bi sai!'});
    }
});

module.exports = router;
