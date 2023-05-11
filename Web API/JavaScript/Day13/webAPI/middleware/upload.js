const multer = require('multer')
const path = require('path')
const uuid4 = require('uuid').v4

const storage =multer.diskStorage({
    destination: (req, file, cb) =>{
        cb(null, 'public/uploads')
    },
    filename: (req, file, cb) => {
        const ext = path.extname(file.originalname.toLowerCase())

        cb(null, `${file.filename}${uuid4()}${ext}`) // `` special string.
    }
})

const fileFilter= (req, file, cb)=>{
    const ext = path.extname(file.originalname.toLowerCase())
    if(!ext.match(/jpg|png|jpeg/)){
        return cb(new Error('Only JPG, PNG and JPEG allowed'), false)
    }
    cb(null, true)
}

const upload = multer({
    storage: storage,
    fileFilter : fileFilter,
    limits: {fileSize : 2* 1024 * 1024} //limit is 2MB
})

module.exports = upload

//npm install uuid
//npm install multer