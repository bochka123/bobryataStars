import dbCon from "../../config/db.config.js"
import AuthController from "./AuthController.js"

class QuestionController{
    async getQuestions(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`select * from mydb.question where Poll_id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async postQuestion(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            let body = req.body
            if (!body) res.status(400).send("Информация не указана!")
            dbCon.query(`insert into mydb.question (id, Description, QuestionType_id, Poll_id) values (${body["id"]}, "${body["description"]}", ${body["QuestionType_id"]}, ${body["poll_id"]});`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Question with id ${body["id"]} succesfully added to poll ${body["poll_id"]}`)
            })
        }
    }

    async deleteQuestion(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`delete from mydb.question where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Question with id: ${id} succesfuly deleted!`)
            })
        }
    }

    async editQuestion(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            let body = req.body
            if (!body) res.status(400).send("Информация не указана!")
            if (!id) res.status(400).send("ID не вказана!")
            dbCon.query(`update mydb.question set Description = "${body["description"]}", QuestionType_id = ${body["QuestionType_id"]}, Poll_id = ${body["poll_id"]} where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Question with id ${id} succesfully edited`)
            })
        }
    }
}

export default new QuestionController();