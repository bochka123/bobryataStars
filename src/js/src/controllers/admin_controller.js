import dbCon from "../../config/db.config.js"
import AuthController from "./AuthController.js"

class AdminController{
    async createAdmin(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            let body = req.body
            body["NumberOfCreatedPolls"] = 0
            if (!body) res.status(400).send("Информация не указана!")
            dbCon.query(`insert into mydb.admin(id, NumberOfCreatedPolls, User_id) values(${body.id}, 0, ${body.User_id})`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(body)
            })
        }
    }

    async deleteAdmin(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`delete from mydb.admin where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Admin with id ${id} deleted!`)
            })
        }
    }
}

export default new AdminController();