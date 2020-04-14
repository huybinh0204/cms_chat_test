var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
// var urlencodedParser = bodyParser.urlencoded({extended: false});
router.use(bodyParser.json());
/* GET home page. */
router.get('/', function (req, res, next) {
    res.render('admin/index', {title: 'Admin'});
    // res.json(rows)
});
router.post('/', function (req, res, next) {
    var username = req.body.username;
    var password = req.body.password;
    console.log("u :"+username,"p :"+password )
    if (username == '' && password == '') {
        res.render('index', {title: 'Bạn chưa nhập thông tin Username & Password'});
    } else if (username == '' || password == '') {
        res.render('index', {title: 'Bạn chưa nhập Username hoặc Password !'});
    }else {
        var sql = `SELECT username , password FROM admin`;
        db.query(sql, function (err, rows, result) {
            if (err) {
                res.status(500).send({error: 'Something failed!'})
            }
            for (var i=0;i<=rows.length;i++){
                console.log("for :"+username);
                console.log("for2 :"+password);
            }
            console.log("qw",rows.username)
            if (rows.username != undefined || rows.password != undefined){
                res.render('index', {title: 'Bạn nhập Username hoặc Password bi sai!'});
            }else {
                res.render('admin/index', {title: 'Admin'});
            }
        })
    }
    // else if (username == 'admin' && password == '123456') {
    //     console.log("adas");
    //     res.render('admin/index', {title: 'Admin'});
    // } else {
    //     res.render('index', {title: 'Bạn nhập Username hoặc Password bi sai!'});
    // }


});

module.exports = router;
