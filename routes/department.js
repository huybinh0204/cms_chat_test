var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var db = require('../server');
router.use(bodyParser.json());
/* GET home page. */
router.get('/', function (req, res, next) {
    var sql1 = "SELECT * FROM department";
    db.query(sql1, function (err, rows, fields) {
        if (err) {
            res.status(500).send({error: 'Something failed!'})
        }
        res.render('admin/department/index', {title: 'Phòng ban', departmentn: rows});
        // res.json(rows)
    })
});
// View thêm mới
router.get('/add/', function (req, res, next) {
    res.render('admin/department/add', {title: 'Admin'});
});
router.post('/add-create', function (req, res, next) {
    var name_department = req.body.name_department;
    var sql = `INSERT INTO department (name_department) VALUES ("${name_department}")`;
    db.query(sql, function(err, result) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.redirect('/admin/department/');
    })
});
// View thêm Sửa lại
router.get('/edit/:id', function(req, res, next) {
    var id = req.params.id;
    console.log(id);
    var sql = `SELECT * FROM department WHERE id=${id}`;
    db.query(sql, function(err, rows, fields) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.render('admin/department/edit', {title: 'Admin', edit_departmen:rows[0]});
        // res.render('admin/department/edit', {title: 'Admin'});
        // res.json(rows[0])
    })
// res.render('admin/department/edit', {title: 'Admin'});
});
router.post('/edit_create/:id', function(req, res, next) {
    var id = req.params.id;
    var name_department = req.body.name_department;
    var sql = `UPDATE department SET name_department="${name_department}" WHERE id=${id}`;
    console.log(sql);
    db.query(sql, function(err, result) {
        if(err) {
            res.status(500).send({ error: 'Somthing failed!' })
        }
        res.redirect('/admin/department/');
    })
});
router.get('/delete/:id', function(req, res, next) {
    var id = req.params.id;
    var sql = `DELETE FROM department WHERE id=${id}`;
    db.query(sql, function(err,result) {
        if(err) {
            res.status(500).send({ error: 'Something failed!' })
        }
        res.redirect('/admin/department/');
    });
})

module.exports = router;
