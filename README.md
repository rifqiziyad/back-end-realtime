<h1 align="center">ExpressJS - Lelegram RESTfull API</h1>

This is a chat website with realtime using socket.io.

[More about Express](https://en.wikipedia.org/wiki/Express.js)

## Built With

[![Express.js](https://img.shields.io/badge/Express.js-4.x-orange.svg?style=rounded-square)](https://expressjs.com/en/starter/installing.html)
[![Node.js](https://img.shields.io/badge/Node.js-v.12.13-green.svg?style=rounded-square)](https://nodejs.org/)
[![Socket.Io](https://img.shields.io/badge/socket.io-4.0-lightgrey)](https://socket.io)

## Requirements

1. <a href="https://nodejs.org/en/download/">Node Js</a>
2. Node_modules
3. <a href="https://www.getpostman.com/">Postman</a>
4. Web Server (ex. localhost)

## How to run the app ?

1. Open app's directory in CMD or Terminal
2. Type `npm install`
3. Make new file a called **.env**, set up first [here](#set-up-env-file)
4. Turn on Web Server and MySQL can using Third-party tool like xampp, etc.
5. Create a database with the name #nama_database, and Import file sql to **phpmyadmin**
6. Open Postman desktop application or Chrome web app extension that has installed before
7. Choose HTTP Method and enter request url.(ex. localhost:3000/)
8. You can see all the end point [here](https://documenter.getpostman.com/view/14048013/Tzm6kvm3)

## Set up .env file

Open .env file on your favorite code editor, and copy paste this code below :

```
DB_HOST=localhost // Database host
DB_USER=root // Database user name
DB_PASS=  // Database password
DB_NAME=real-time-app // Database name
DB_PORT=3003 // Port

SMTP_EMAIL=YOUR_EMAIL // Your email
SMTP_PASSWORD=YOUR_EMAIL_PASSWORD / Your email password
```

## License

© [Rifqi Ziyad Imtinan](https://github.com/rifqiziyad)
