const express = require('express')
require('dotenv').config()
const morgan = require('morgan')
const cors = require('cors')
const xss = require('xss-clean')
const helmet = require('helmet')
const compression = require('compression')
const bodyParser = require('body-parser')
const routerNavigation = require('./routes')
const socket = require('socket.io')

const app = express()
const port = process.env.PORT || 3003

app.use(morgan('dev'))
app.use(cors())
app.options('*', cors())
app.use(xss())
app.use(helmet())
app.use(compression())
// parse application/x-www-form-urlencoded
app.use(bodyParser.urlencoded({ extended: false }))
// parse application/json
app.use(bodyParser.json())
app.use('/backend3/api/v1', routerNavigation)
app.use('/backend3/api', express.static('src/uploads'))

const server = require('http').createServer(app)
const io = socket(server, {
  cors: {
    origin: '*'
  },
  path: '/backend3/socket.io'
})

let listUserOnline = [] // id
console.log(listUserOnline)
io.on('connection', (socket) => {
  console.log('Socket.io Connect !')

  // ==========================================
  // globalMessage = pesan untuk semua client
  // socket.on('globalMessage', (data) => {
  //   console.log(data)
  //   io.emit('chatMessage', data)
  // })
  // ==========================================
  // privateMessage = pesan untuk satu client
  // socket.on('privateMessage', (data) => {
  //   console.log(data)
  //   socket.emit('chatMessage', data)
  // })
  // ==========================================
  // brodcastMessage = pesan terkirim ke semua cleint kecuali pengirim (notification)
  // socket.on('brodcastMessage', (data) => {
  //   console.log(data)
  //   socket.broadcast.emit('chatMessage', data)
  // })
  // ==========================================
  // Kalau menggunakan socket.join, pasti menggunakan socket.leave
  // ==========================================

  socket.on('connect-server', (userId) => {
    if (!listUserOnline.includes(parseInt(userId))) {
      listUserOnline.push(parseInt(userId))
    }
    io.emit('list-user-online', listUserOnline)
    // console.log(listUserOnline)
    // JOIN ROOM FOR NOTIF
    socket.join(parseInt(userId))
  })

  socket.on('disconnect-server', (userid) => {
    listUserOnline = listUserOnline.filter(
      (element) => element !== parseInt(userid)
    )
    io.emit('list-user-online', listUserOnline)
    // LEAVE ROOM FOR NOTIF
    socket.leave(userid)
  })

  socket.on('join-room', ({ room, oldRoom }) => {
    // console.log(room, oldRoom)
    if (oldRoom) {
      socket.leave(oldRoom)
    }
    socket.join(room)
  })

  socket.on('send-message', (data) => {
    io.to(data.room).emit('chat-message', data)
  })

  socket.on('notif-message', (data) => {
    console.log(data)
    socket.broadcast.to(parseInt(data.receiverId)).emit('notification', data)
  })

  socket.on('typing-message', (data) => {
    socket.broadcast.to(data.room).emit('typing', data)
  })
})

server.listen(port, () => {
  console.log(`Express app is listen on port ${port} !`)
})
