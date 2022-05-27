import jsonwebtoken from "jsonwebtoken";
import dbCon from "../../config/db.config.js"

const Jwt = jsonwebtoken
const TOKEN_SECRET = "ZACHEM_YA_PISHU_ETO_NERABOCHEE_GIVNO";

class AuthController{
    register(req, res){
        let body = req.body
        if (!body["name"] || !body["password"] || !body["email"]) res.status(400).json("Інформація не вказана!")
        else{
            dbCon.query(`select email from mydb.user where email = "${body["email"]}";`, (err, response)=>{
                if (err) res.status(500).json(err)
                else {
                    if (response.length == 0){
                        body["id"] = Date.now().toString().substring(2, 11)
                        dbCon.query(`insert into mydb.user (id, name, email, password, Organization_id) values (${body["id"]}, "${body["name"]}", "${body["email"]}", "${body["password"]}", ${body["Organization_id"]})`, (err, response)=>{
                            if (err) res.status(500).json(err)
                            else res.status(200).json(body)
                        })
                    }
                    else {
                        res.send(`Акаунт з email ${body["email"]} вже існує!`)
                    }
                }
            })
        }  
    }
    
    login(req, res){
        let body = req.body
        const email = body["email"]
        if (!body["email"] || !body["password"] || !body["id"]) res.status(400).json("Інформація не вказана!")
        else{
            dbCon.query(`select password from mydb.user where email = "${email}"`, (err, response)=>{
                if (err) res.status(500).json(err)
                else{
                    if (response.length === 0){
                        res.send("Невірні введені дані!")
                    }
                    else{
                        const token = Jwt.sign({ user_id: body["id"], email }, TOKEN_SECRET, {
                            expiresIn: "2h",
                          });
                        res.status(200).json(token)
                    }
                }
            })
          }
    } 
    
      async authorize(req, res){
        const authHeader = req.headers["authorization"];
        const token = authHeader;
        return new Promise((resolve, reject)=>{
            if (!token) {
                resolve(false)
                res.send("Відсутній аутентифікаційний токен!")
            }
        else{
            Jwt.verify(token, TOKEN_SECRET, (err, claims) => {
                if (err) {
                    resolve(false)
                    res.send("Некоректний аутентифікаційний токен!")
                }
                else{
                    resolve(claims)
                }
            });
            }   
        })
    }
}
export default new AuthController()