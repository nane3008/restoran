const express = require('express');
const bodyParser = require('body-parser');
const mysql = require('mysql');

const app = express();
const port = 3000;

const db = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: 'your_password',
    database: 'Restoran'
});

db.connect(err => {
    if (err) {
        throw err;
    }
    console.log('MySQL connected...');
});

app.use(bodyParser.json());

app.post('/place-order', (req, res) => {
    const { items, name, email, address, cardNumber, expiryDate, cvv, total } = req.body;

    const orderQuery = 'INSERT INTO orders (name, email, address, cardNumber, expiryDate, cvv, total) VALUES (?, ?, ?, ?, ?, ?, ?)';
    const orderValues = [name, email, address, cardNumber, expiryDate, cvv, total];

    db.query(orderQuery, orderValues, (err, result) => {
        if (err) {
            res.status(500).send('Error placing order');
            return;
        }

        const orderId = result.insertId;

        const itemsQuery = 'INSERT INTO order_items (order_id, name, price, description) VALUES ?';
        const itemsValues = items.map(item => [orderId, item.name, item.price, item.description]);

        db.query(itemsQuery, [itemsValues], (err) => {
            if (err) {
                res.status(500).send('Error saving order items');
                return;
            }

            res.status(200).send('Order placed successfully');
        });
    });
});

app.listen(port, () => {
    console.log(`Server running on port ${port}`);
});
