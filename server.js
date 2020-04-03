const mysql = require('mysql');

const connection = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "vnpost_chat"
});

connection.connect(function(err) {
    if (err) throw err;
    console.log('kn thanh cong!');
});

module.exports = connection;
