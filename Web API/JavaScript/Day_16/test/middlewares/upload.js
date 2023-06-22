const multer = require('multer')
const uuid4 = require('uuid').v4
const path = require('path')

const storage = multer.diskStorage({
    destination: (req, file, cb) => {
        cb(null, "public/uploads")
    },
    filename: (req, file, cb) => {
        const ext = path.extname(file.originalname.toLowerCase())
        cb(null, `${file.fieldname}${uuid4()}${ext}`)
    }
})

const fileFilter = (req, file, cb) => {
    const ext = path.extname(file.originalname.toLowerCase())
    if (!ext.match(/jpg|png|jpeg/)) {
        return cb(new Error('only jpg, png and jpeg are allowed'), false)
    }
    cb(null, true)
}

const upload = multer({
    storage: storage,
    fileFilter: fileFilter,
    limits: { fileSize: 2 * 1024 * 1024 }
})

module.exports = upload