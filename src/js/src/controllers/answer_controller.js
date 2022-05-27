import dbCon from "../../config/db.config.js"
import AuthController from "./AuthController.js"

class AnswerController{
    async getAnswerOnQuestion(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`select * from mydb.answer where Question_id = ${id};`, (err, response)=>{
            if (err) res.status(500).json(err)
            else res.status(200).json(response)
        })
        }
    }

    async postAnswer(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            let body = req.body
            if (!body) res.status(400).send("Информация не указана!")
            dbCon.query(`insert into mydb.answer (id, Content, Question_id, PollResult_id) values (${body["id"]}, "${body["content"]}", ${body["Question_id"]}, ${body["PollResult_id"]});`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Answer with id ${body["id"]} succesfully added to poll ${body["poll_id"]}`)
            })
        }
    }

    async deleteAnswer(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`delete from mydb.answer where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Answer with id: ${id} succesfuly deleted!`)
            })
        }
    }
}

export default new AnswerController();