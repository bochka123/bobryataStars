import express from "express";
import UserController from "./controllers/user_controller.js";
import OrganizationController from "./controllers/organization_controller.js";
import AdminController from "./controllers/admin_controller.js";
import PollController from "./controllers/poll_controller.js";
import QuestionController from "./controllers/question_controller.js";
import AuthController from "./controllers/AuthController.js";
import AnswerController from "./controllers/answer_controller.js";
import PollResultController from "./controllers/poll_result_controller.js";

const router = express.Router()

router.post("/register", AuthController.register)
router.post("/login", AuthController.login)

router.get("/users", UserController.getAllUsers)
router.get("/users/:id", UserController.getUser) 
router.delete("/users", UserController.deleteUser) // удалит юзера только без записей в бд
router.put("/users", UserController.changeInformation) // смена инфы токо залогиненого юзера

router.get("/organizations", OrganizationController.getAllOrganizations)
router.get("/organizations/:id", OrganizationController.getOrganization)
router.post("/organizations", OrganizationController.postOrganization)
router.delete("/organizations/:id", OrganizationController.deleteOrganization)

router.post("/admin", AdminController.createAdmin)
router.delete("/admin/:id", AdminController.deleteAdmin)

router.get("/polls", PollController.getAllpolls)
router.get("/polls/:id", PollController.getPoll)
router.post("/polls", PollController.postPoll)
router.delete("/polls/:id", PollController.deletePoll)

router.get("/question/:id", QuestionController.getQuestions)
router.post("/question", QuestionController.postQuestion)
router.delete("/question/:id", QuestionController.deleteQuestion)
router.put("/question/:id", QuestionController.editQuestion)

router.get("/pollresults", PollResultController.getAllResults)
router.get("/pollresults/:id", PollResultController.getAnswers)
router.post("/pollresults", PollResultController.postPollResult)

router.get("/answer/:id", AnswerController.getAnswerOnQuestion)
router.post("/answer", AnswerController.postAnswer)
router.delete("/answer/:id", AnswerController.deleteAnswer)

export default router;