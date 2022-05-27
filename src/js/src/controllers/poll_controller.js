import dbCon from "../../config/db.config.js"
import AuthController from "./AuthController.js"

class PollController{
    async getAllpolls(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            dbCon.query('select * from mydb.poll;', (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async getPoll(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`select * from mydb.poll where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async postPoll(req, res){
        const answer = await AuthController.authorize(req, res).then()
        let id = 0
        dbCon.query(`select id from mydb.admin where User_id = ${answer.user_id};`, (error, resp)=>{
            if (error) res.status(500).json(error)
            else {
                if (resp.length == 0) {
                    res.status(400).json("Ви не маєте права створювати опитування")
                }
                else{
                    id = resp[0].id
                    if (answer) { 
                        let body = req.body
                        body["admin_d"] = id
                        if (!body) res.status(400).send("Информация не указана!")
                        if (!body["organization_id"]){
                            dbCon.query(`insert into mydb.poll (id, Title, Description, Admin_id) values (${body["id"]}, "${body["title"]}", "${body["description"]}", "${id}")`, (err, response)=>{
                                if (err) res.status(500).json(err)
                                else res.json(body)
                            })
                        }
                        else{
                            dbCon.query(`insert into mydb.poll (id, Title, Description, Organization_id, Admin_id) values (${body["id"]}, "${body["title"]}", "${body["description"]}", "${body["organization_id"]}, "${id}")`, (err, response)=>{
                                if (err) res.status(500).json(err)
                                else res.json(body)
                            })
                        }
                    }
                }
            }
        })
    }

    async deletePoll(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`delete from mydb.poll where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Poll with id: ${id} succesfuly deleted!`)
            }) 
        }
    }
}

export default new PollController();