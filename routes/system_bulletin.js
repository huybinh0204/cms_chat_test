var express = require('express');
var router = express.Router();
var bodyParser = require('body-parser');
var shortid=require('shortid');
var db = require('../server');
var multer = require('multer');
router.use(bodyParser.json());
var storage = multer.diskStorage({
    destination: function (req, file, cb) {
        cb(null, './public/Image');

    }, filename: function (req, file, cb) {
        cb(null, shortid.generate() + "00" + file.originalname );
    }
});
var upload = multer({ storage: storage });

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
router.post('/add-create',upload.single('image_album'), function (req, res, next) {
    var image_album = "http://localhost:3000/";
    var name_file = req.file.path.replace('public','');
    var image_album1 = "http://localhost:3000/Image/" + name_file.substr(6);
    var content = req.body.content;
    console.log(image_album);
    console.log(image_album1);
    var sql = `INSERT INTO new_post (content,image_album) VALUES ("${content}","${image_album1}")`;
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
