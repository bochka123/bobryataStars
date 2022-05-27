import dbCon from "../../config/db.config.js"
import AuthController from "./AuthController.js"

class UserController{
    async getAllUsers(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            dbCon.query('select id, name, email, Organization_id from mydb.user;', (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })  
        }
    }

    async getUser(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`select id, name, email, Organization_id from mydb.user where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async deleteUser(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`delete from mydb.user where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`User with id: ${id} succesfuly deleted!`)
            })
        }  
    }

    async changeInformation(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            let body = req.body
            if (!body) res.status(400).send("Информация не указана!")
            if (!body["Organization_id"]){
                dbCon.query(`update mydb.user set name = "${body["name"]}", email = "${body["email"]}", password = "${body["password"]}"  where id = ${answer.user_id};`, (err, response)=>{
                    if (err) res.status(500).json(err)
                    else res.status(200).json(body)
                })
            }
            else{
                dbCon.query(`update mydb.user set name = "${body["name"]}", email = "${body["email"]}", password = "${body["password"]}", Organization_id = ${body["Organization_id"]}  where id = ${answer.user_id};`, (err, response)=>{
                    if (err) res.status(500).json(err)
                    else res.status(200).json(body)
                })
            }
        } 
    }
}

export default new UserController()
