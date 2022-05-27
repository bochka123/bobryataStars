import dbCon from "../../config/db.config.js"
import dateFormat from "dateformat"
import AuthController from "./AuthController.js"
import UC from "./user_controller.js"

class OrganizationController{
    async getAllOrganizations(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            dbCon.query('select * from mydb.organization;', (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async getOrganization(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`select * from mydb.organization where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(response)
            })
        }
    }

    async postOrganization(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            let body = req.body
            const date = dateFormat(new Date(), "yyyy-mm-dd")
            if (!body["id"]||!body["name"]||!body["description"]) {
                res.status(400).send("Информация не указана!")
                return null
            }
            dbCon.query(`insert into mydb.organization (id, Name, Description, CreationDate) values (${body["id"]}, "${body["name"]}", "${body["description"]}", "${date}")`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).json(body)
            })
        }
    }

    async deleteOrganization(req, res){
        const answer = await AuthController.authorize(req, res).then()
        if (answer) { 
            const {id} = req.params
            if (!id) res.status(400).send("Id не указан!")
            dbCon.query(`delete from mydb.organization where id = ${id};`, (err, response)=>{
                if (err) res.status(500).json(err)
                else res.status(200).send(`Organization with id: ${id} succesfuly deleted!`)
            })
        }
    }
}

export default new OrganizationController()