const connection = require('../../config/mysql')

module.exports = {
  getDataRoomChat: (id, search) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT * FROM room_chat JOIN user ON room_chat.user_id = user.user_id WHERE room_chat.friend_id = ${id} AND user.user_name LIKE '%${search}%' `,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  },
  countRoomChatData: (id, search) => {
    return new Promise((resolve, reject) => {
      connection.query(
        `SELECT COUNT(*) FROM room_chat JOIN user ON room_chat.user_id = user.user_id WHERE room_chat.friend_id = ${id} AND user.user_name LIKE '%${search}%'`,
        (error, result) => {
          !error ? resolve(result) : reject(new Error(error))
        }
      )
    })
  }
}
