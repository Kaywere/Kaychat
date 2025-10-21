import express from 'express'
const router=express.Router()

router.get("/send",(req,res) => {
res.send("yes yes yes")

}

)

export default router