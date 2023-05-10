const jwt = require('jsonwebtoken')

const verifyUser = (req, res, next) => {
    let token = req.headers.authorization
    if (!token) return res.status(401).json({ error: 'auth token not present' })
    token = token.split(' ')[1]

    jwt.verify(token, process.env.SECRET, (err, payload) => {
        if (err) return res.status(401).json({ error: err.message })
        req.user = payload
        console.log(req.user)
    })
    next()
}
 
const verifyAdmin = (req, res, next) =>{
    if(req.user.role !== 'admin') {
        return res.status(403).json({error: "You are not admin"})
    }else if(req.user.role == 'admin')
    {
        next()    
    }
}

module.exports = { verifyUser, verifyAdmin }


//npm install jsonwebtoken
//db.users.updateOne({username: 'asddddd2222d'}, {$set : {role: 'admin'}})