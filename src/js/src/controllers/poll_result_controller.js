import dbCon from "../../config/db.config.js"
import AuthController from "./AuthController.js"
import dateFormat from "dateformat"

class PollResultController{
    async getAllResults(req, res){
        dbCon.query('select * from mydb.pollresult;', (err, response)=>{
            if (err) res.status(500).json(err)
            else res.status(200).json(response)
        })
    }

    async getAnswers(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`select * from mydb.answer where PollResult_id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async postPollResult(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            let body = req.body
            if (!body) res.status(400).send("Информация не указана!")
            if (body["id"]||body["Poll_id"]){
                body["user_id"] = answer.user_id
                const date = dateFormat(new Date(), "yyyy-mm-dd")
                dbCon.query(`insert into mydb.pollresult (id, Date, Poll_id, User_id) values (${body["id"]}, "${date}", "${body["Poll_id"]}", "${answer.user_id}")`, (err, response)=>{
                    if (err) res.status(500).json(err)
                    else res.status(200).json(body)
                })
            }
            else{
                res.status(400).send("Дані не заповнені!")
            }
        }
    }
}

export default new PollResultController();