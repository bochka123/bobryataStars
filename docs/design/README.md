# Проєктування бази даних

В рамках проекту розробляється: 
- модель бізнес-об'єктів 
- ER-модель
- реляційна схема

## Модель бізнес-об'єктів 

## ER-модель

@startuml

	entity User <<ENTITY>> {
		Authorised: BOOL
	}

	entity AuthorisedUser <<ENTITY>> {
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
		ForWhichOrganization: TEXT
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

	User "0,"-->"1,1" AuthorisedUser

	AuthorisedUser "0,"-->"1,1" Admin

	AuthorisedUser "0,"-->"1,1" Organization

	Admin "0,"-->"1,1" Poll

	Poll "0,"-->"1,1" Organization

	Poll "0,"-->"1,1" AuthorisedUser

	Question "0,"-->"1,1" Poll

	AnswerOption "0,"-->"1,1" Question

	QuestionType "0,"-->"1,1" Question

	QuestionType "0,"-->"1,1" Answer

	Answer "0,"-->"1,1" Question

	Answer "0,"-->"1,1" PollResult
	
@enduml

## Реляційна схема
