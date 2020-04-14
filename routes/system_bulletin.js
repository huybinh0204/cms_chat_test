var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var multer = require('multer');
var shortid=require('shortid');
var db = require('../server');
router.use(bodyParser.json());

/* GET home page. */
router.get('/', function (req, res, next) {
    var sql1 = "SELECT * FROM new_post WHERE user_id =0";
    db.query(sql1, function (err, rows, fields) {
        if (err) {
            res.status(500).send({error: 'Something failed!'})
        }
        res.render('admin/system_bulletin/index', {title: 'Bản tin hệ thống', new_postn: rows});
        // res.json(rows)
    })
});

// View thêm mới
router.get('/add/', function (req, res, next) {
    res.render('admin/system_bulletin/add', {title: 'Admin'});
});
router.post('/add-create', function (req, res, next) {
    var content = req.body.content;
    var sql = `INSERT INTO new_post (content) VALUES ("${content}")`;
    db.query(sql, function (err, result) {
        if (err) {
            res.status(500).send({error: 'Something failed!'})
        }
        res.redirect('/admin/system_bulletin/');
    })
});
// View thêm Sửa lại
router.get('/edit/:id', function (req, res, next) {
    var id = req.params.id;
    console.log(id);
    var sql = `SELECT * FROM new_post WHERE id=${id}`;
    db.query(sql, function (err, rows, fields) {
        if (err) {
            res.status(500).send({error: 'Something failed!'})
        }
        res.render('admin/system_bulletin/edit', {title: 'Admin', edit_new_post: rows[0]});
        // res.render('admin/department/edit', {title: 'Admin'});
        // res.json(rows[0])
    })
// res.render('admin/department/edit', {title: 'Admin'});
});
router.post('/edit_create/:id', function (req, res, next) {
    var id = req.params.id;
    var content = req.body.content;
    var privacy = req.body.privacy;
    var image_album = req.body.image_album;
    var video_alum = req.body.video_alum;
    var sql = `UPDATE new_post SET content="${content}", privacy="${privacy}", image_album="${image_album}" ,video_alum="${video_alum}" WHERE id=${id}`;
    console.log(sql);
    db.query(sql, function (err, result) {
        if (err) {
            res.status(500).send({error: 'Somthing failed!'})
        }
        res.redirect('/admin/system_bulletin/');
    })
});
router.get('/delete/:id', function (req, res, next) {
    var id = req.params.id;
    var sql = `DELETE FROM new_post WHERE id=${id}`;
    db.query(sql, function (err, result) {
        if (err) {
            res.status(500).send({error: 'Something failed!'})
        }
        res.redirect('/admin/system_bulletin/');
    });
})

module.exports = router;
