# Проєктування бази даних

В рамках проекту розробляється: 
- модель бізнес-об'єктів 
- ER-модель
- реляційна схема

## Модель бізнес-об'єктів 

@startuml

	entity User <<ENTITY>> #5ED2B8

	entity Admin <<ENTITY>> #5ED2B8 

	entity Organization <<ENTITY>> #5ED2B8 

	entity Poll <<ENTITY>> #5ED2B8 

	entity Question <<ENTITY>> #5ED2B8 

	entity AnswerOption <<ENTITY>> #5ED2B8 

	entity QuestionType <<ENTITY>> #5ED2B8 
	
	entity Answer <<ENTITY>> #5ED2B8 

	entity PollResult <<ENTITY>> #5ED2B8 

	User "0,"-->"1,1" Admin
	User "0,"-->"1,1" Organization
	Admin "0,"-->"1,1" Poll
	Poll "0,"-->"1,1" Organization
	Poll "0,"-->"1,1" User
	Question "0,"-->"1,1" Poll
	AnswerOption "0,"-->"1,1" Question
	QuestionType "0,"-->"1,1" Question
	QuestionType "0,"-->"1,1" Answer
	Answer "0,"-->"1,1" Question
	Answer "0,"-->"1,1" PollResult

    User.Name--* User
    User.Email --* User
    User.Password --* User
    User.Organization --* User

	Admin.NumberOfCreatedPolls --* Admin 

    Organization.Name --* Organization 
    Organization.Description --* Organization 
    Organization.CreationDate --* Organization 

    Poll.Title --* Poll
    Poll.Description --* Poll

    Question.Type --* Question
    Question.Description --* Question

    AnswerOption.Name --* AnswerOption
    AnswerOption.Index --* AnswerOption

    QuestionType.Name --* QuestionType
    QuestionType.Description  --* QuestionType

    Answer.Content --* Answer
    Answer.Question --* Answer
    Answer.Type --* Answer

    PollResult.Date --* PollResult
    PollResult.Respondent --* PollResult
    PollResult.Result --* PollResult

@enduml

## ER-модель

@startuml

	entity User <<ENTITY>> {
		Name: TEXT
		Password: TEXT
		Email: TEXT
		Organization: TEXT
	}

	entity Admin <<ENTITY>> {
		NumberOfCreatedPolls: NUMBER
	}

	entity Organization <<ENTITY>> {
		Name: TEXT
		Description: TEXT
		CreationDate: DATE
	}

	entity Poll <<ENTITY>> {
		Title: TEXT
		Description: TEXT
	}

	entity Question <<ENTITY>> {
		Type: TEXT
		Description: TEXT
	}

	entity AnswerOption <<ENTITY>> {
		Name: TEXT
		Index: NUMBER
	}

	entity QuestionType <<ENTITY>> {
		Name: TEXT
		Description: TEXT
	}

	entity Answer <<ENTITY>> {
		Content: TEXT
		Question: TEXT
		QuestionType: TEXT
	}

	entity PollResult <<ENTITY>> {
		Date: DATE
		Respondent: TEXT
		Result: TEXT
	}

	User "0,"-->"1,1" Admin

	User "0,"-->"1,1" Organization

	Admin "0,"-->"1,1" Poll

	Poll "0,"-->"1,1" Organization

	Poll "0,"-->"1,1" User

	Question "0,"-->"1,1" Poll

	AnswerOption "0,"-->"1,1" Question

	QuestionType "0,"-->"1,1" Question

	QuestionType "0,"-->"1,1" Answer

	Answer "0,"-->"1,1" Question

	Answer "0,"-->"1,1" PollResult
	
@enduml

## Реляційна схема
