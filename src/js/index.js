import express from "express";
import routes from "./src/routes.js" 

const app = express()
app.use(express.json())

const PORT = 5000;

app.use(routes)

app.get('/', (req, res)=>{
    res.send('<b>Main Page</b>')
})

app.listen(PORT, ()=>{
    console.log(`Express Server is running on port: http://localhost:${PORT}`);
})