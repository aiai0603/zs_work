const express = require('express');
const app = express();
const mongoose = require('mongoose');
require('dotenv/config');
const postRoute = require('./routers/posts');
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(cors());
app.use(bodyParser.json());
app.use('/posts',postRoute);

app.get('/',(req,res) => {
    res.send('we are on home');
});

mongoose.connect(process.env.DB_CONNECTION,{ useNewUrlParser: true },() => console.log('connnect to DB!')
);

app.listen(3000);