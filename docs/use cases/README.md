# Модель прецедентів

В цьому файлі необхідно перелічити всі документи, розроблені в проекті та дати посилання на них.

*Модель прецедентів повинна містити загальні оглядові діаграми та специфікації прецедентів.*



Вбудовування зображень діаграм здійснюється з використанням сервісу [plantuml.com](https://plantuml.com/). 

## Сценарії використання для користувача
<br><br>

- ID: bobr.NOT_LOGGED.001

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

    @startuml

        left header
            <font color=000 size=10><b>ID:</b> bobr.NOT_LOGGED.001
            <font color=000 size=10><b>НАЗВА:</b> Зареєструватись у системі
            <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
            <font color=000 size=10><b>ПЕРЕДУМОВИ:</b> Користувач не зареєстрований у системі.
            <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Новий обліковий запис
            <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b> bobr.NOT_LOGGED.EX.001
            <font color=000 size=10>
        end header

        |Користувач|
            start
            :Натискає кнопку "Реєстрація";
            :Вводить реєстраційні дані:
            Логін, пароль та пошта;

        |Система|
            :Перевіряє введені реєстраційні дані;
            note right #red: можлива  bobr.NOT_LOGGED.EX.001

        |Користувач|
            :Реєструє компанію в системі (bobr.ORGANIZATION.001)
            або приєднується до вже існуючої (bobr.ORGANIZATION.002);
            note right: необов'язковий етап

        |Система|
            :Створює обліковий запис за переданими реєстраційними даними;
            :Надає користувачу інформацію про створений обліковий запис;

        |Користувач|
            :Завершує взаємодію;
            stop
    @enduml

    </center>

- ID: bobr.NOT_LOGGED.002

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

    @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.NOT_LOGGED.002
             <font color=000 size=10><b>НАЗВА:</b> Авторизуватись у системі
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b> 
             <font color=000 size=10> Користувач не зареєстрований у системі.
             <font color=000 size=10> Користувач не авторизований у системі.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Авторизація у системі
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b> 
             <font color=000 size=10> bobr.NOT_LOGGED.EX.002
             <font color=000 size=10> bobr.NOT_LOGGED.EX.003
             <font color=000 size=10>
         end header

            |Користувач|
            start
                :Натискає кнопку "Вхід";
                :Вводить реєстраційні дані:
                Логін, пароль;

            |Система|
                :Ідентифікує користувача;
                note right #red: можлива  bobr.NOT_LOGGED.EX.002
                :Авторизує користувача;
                note right #red: можлива  bobr.NOT_LOGGED.EX.003
                :Надає користувачу авторизацію у системі;

            |Користувач|
                :Завершує взаємодію;
                stop
    @enduml
    </center>

## Сценарії для авторизованого користувача
<br><br>
- ID: bobr.USER.001
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
                <font color=000 size=10><b>ID:</b> bobr.USER.001
                <font color=000 size=10><b>НАЗВА:</b> Отримати дані для проходження опитування
                <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
                <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
                <font color=000 size=10>Користувач авторизований у системі.
                <font color=000 size=10>Користувач має доступ до запитаного опитування.
                <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Дані для проходження опитування.
                <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.001
                <font color=000 size=10>bobr.DATA.EX.002
            end header
            |Користувач|
            start
            :Запитує дані для проходження опитування;

            |Система|
            :Знаходить дані для проходження опитування;
            note right: можлива bobr.DATA.EX.001
            :Авторизує користувача для отримання даних;
            note right: можлива bobr.DATA.EX.002
            :Надає дані для проходження опитування;

            |Користувач|
            :Отримує дані для проходження опитування;
            :Завершує вазємодію;
            stop


            <style>
            note{
                BackgroundColor: red;
            }
            </style>

  @enduml

    </center>


- ID: bobr.USER.002
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
                <font color=000 size=10><b>ID:</b> bobr.USER.002
                <font color=000 size=10><b>НАЗВА:</b> Надіслати результати опитування користувача.
                <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
                <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
                <font color=000 size=10>Користувач авторизований у системі.
                <font color=000 size=10>Користувач має доступ до запитаного опитування.
                <font color=000 size=10>Користувач коректно пройшов опитування.
                <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про зарахування результатів опитування користувача
                <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.001
                <font color=000 size=10>bobr.DATA.EX.002
                <font color=000 size=10>bobr.DATA.EX.003
            end header
            |Користувач|
            start
            :Надає дані про проходження опитування;

            |Система|
            :Знаходить дані про запитане опитування;
            note right: можлива bobr.DATA.EX.001
            :Авторизує користувача для проходження опитування;
            note right: можлива bobr.DATA.EX.002
            :Перевіряє правильність даних про проходження опитування;
            note right: можлива bobr.DATA.EX.003
            :Надає користувачу повідомлення про зарахування результатів опитування;

            |Користувач|
            :Завершує вазємодію;
            stop


            <style>
            note{
            BackgroundColor: red;
            }
            </style>

  @enduml

    </center>

- ID: bobr.USER.003
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
                <font color=000 size=10><b>ID:</b> bobr.USER.003
                <font color=000 size=10><b>НАЗВА:</b> Отримати зворотній зв'язок.
                <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
                <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
                <font color=000 size=10>Користувач авторизований у системі.
                <font color=000 size=10>У системі є дані про зворотній зв'язок.
                <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Отримання користувачем зворотнього зв'язку.
                <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.001
                <font color=000 size=10>bobr.DATA.EX.002
            end header
            |Користувач|
            start
            :Натискає на отримання даних про зворотній зв'язок;

            |Система|
            :Перевіряє, чи існує задане опитування;
            note right: можлива bobr.DATA.EX.001
            :Перевіряє, чи є доступ у користувача до заданого опитування;
            note right: можлива bobr.DATA.EX.002
            :Шукає дані про задане опитування;
            :Надає користувачу дані про зворотній зв'язок стосовно опитування;

            |Користувач|
            :Завершує вазємодію;
            stop


            <style>
            note{
            BackgroundColor: red;
            }
            </style>

  @enduml

    </center>

- ID: bobr.USER.004
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
                <font color=000 size=10><b>ID:</b> bobr.USER.004
                <font color=000 size=10><b>НАЗВА:</b> Подати заявку на отримання права адміністратора.
                <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
                <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
                <font color=000 size=10>Користувач авторизований у системі.
                <font color=000 size=10>У користувача є достатні матеріальні можливості.
                <font color=000 size=10><b>РЕЗУЛЬТАТ:</b>Отримання користувачем прав адміністратора.
                <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.MONEY.EX.001
                <font color=000 size=10>bobr.MONEY.EX.002
            end header
            |Користувач|
            start
            :Натискає на отримання права адміністратора;

            |Система|
            :Надає користувачу форму для заповнення платіжних даних;
            :Перевіряє платіжні дані;
            note right: можлива bobr.MONEY.EX.001
            :Здійснює платіж;
            note right: можлива bobr.MONEY.EX.002
            :повідомляє користувача про успішний перебіг транзакції та отримання прав адміністратора;

            |Користувач|
            :Завершує вазємодію;
            stop


            <style>
            note{
            BackgroundColor: red;
            }
            </style>

  @enduml

    </center>

## Сценарії для адміністратора
<br><br>
- ID: bobr.ADMIN.001

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ADMIN.001
             <font color=000 size=10><b>НАЗВА:</b> Створити опитування
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про створення опитування.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
             <font color=000 size=10>bobr.DATA.EX.002
             <font color=000 size=10>bobr.DATA.EX.003
         end header

         |Користувач|
             start
             : Надсилає запит на створення опитування та його дані ;
             : Заповнює дані про опитування:
             Логін, пароль та пошта;

         |Система|
             : Перевіряє право створення користувачем опитування ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note

             : Перевіряє правильність надісланих даних ;

            note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.003</b>
             end note

             : Створює опитування;

             : Надсилає користувачу повідомлення про створення опитування ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>

- ID: bobr.ADMIN.002

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ADMIN.002
             <font color=000 size=10><b>НАЗВА:</b> Редагувати опитування
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про змінення даних опитування.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
             <font color=000 size=10>bobr.DATA.EX.001
             <font color=000 size=10>bobr.DATA.EX.002
             <font color=000 size=10>bobr.DATA.EX.003
         end header

         |Користувач|
             start
             : Надсилає запит на змінення даних опитування ;

         |Система|
             : Знаходить дані про організацію та опитування ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.001</b>
             end note

             : Перевіряє право на зміну опитування ;

            note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note

             : Перевіряє правильність надісланих даних ;

            note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.003</b>
            end note

             : Змінює опитування;

             : Надсилає користувачу повідомлення про змінення опитування ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>

- ID: bobr.ADMIN.003

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ADMIN.003
             <font color=000 size=10><b>НАЗВА:</b> Отримати результати опитування
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Результати опитування.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
             <font color=000 size=10>bobr.DATA.EX.001
             <font color=000 size=10>bobr.DATA.EX.002
         end header

         |Користувач|
             start
             : Надсилає запит на отримання результатів опитування ;

         |Система|
             : Знаходить дані про опитування ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.001</b>
             end note

             : Перевіряє право на отримання результатів опитування ;

            note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note

             : Надсилає користувачу результати опитування ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>


- ID: bobr.ADMIN.004

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ADMIN.004
             <font color=000 size=10><b>НАЗВА:</b> Закрити опитування
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Результати опитування.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
             <font color=000 size=10>bobr.DATA.EX.001
             <font color=000 size=10>bobr.DATA.EX.002
         end header

         |Користувач|
             start
             : Надсилає запит на закриття опитування ;

         |Система|
             : Знаходить дані про опитування ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.001</b>
             end note

             : Перевіряє право на закриття опитування ;

            note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note
             
             : Закриває опитування ;

             : Надсилає користувачу результати опитування та повідомлення про його закриття ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>

- ID: bobr.ADMIN.005

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ADMIN.005
             <font color=000 size=10><b>НАЗВА:</b> Відновити роботу опитування
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Результати опитування.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
             <font color=000 size=10>bobr.DATA.EX.001
             <font color=000 size=10>bobr.DATA.EX.002
         end header

         |Користувач|
             start
             : Надсилає запит на відновлення роботи опитування ;

         |Система|
             : Знаходить дані про опитування ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.001</b>
             end note

             : Перевіряє право на відновлення роботи опитування ;

            note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note
             
             : Відновлює роботу опитування ;

             : Надсилає користувачу повідомлення про відновлення роботи опитування ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>
 
## Сценарії для менеджера організацій
<br><br>   
- ID: bobr.ORGANIZATION.001

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ORGANIZATION.001
             <font color=000 size=10><b>НАЗВА:</b> Зареєструвати організацію
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>Користувач авторизований у системі.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.003
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про створення організації
         end header

         |Користувач|
             start
             : Надсилає запит на створення організації ;

         |Система|
             : Надає користувачу форму для заповнення даних про організацію ;

         |Користувач|
             : Надає у формі потрібні дані про організацію ;

         |Система|
             : Перевіряє правильність надісланих даних ;
             
             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.003</b>
             end note

             : Реєструє організацію ;

             : Додає користувача до створеної організації ;

             : Надсилає користувачу дані про реєстрацію організації ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>

- ID: bobr.ORGANIZATION.002

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ORGANIZATION.002
             <font color=000 size=10><b>НАЗВА:</b> Приєднатися до існуючої організації
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>Користувач авторизований у системі.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.002
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b>Повідомлення про приєднання до організації
         end header

         |Користувач|
             start
             : Надсилає запит на приєднання до існуючої організації ;

         |Система|
             : Надає користувачу список організацій ;

         |Користувач|
             : Обирає організацію з наданого системою списку ;

             : Надає дані для перевірки належності до організації ;

         |Система|
             : Перевіряє надані користувачем дані ;
             
             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note

             : Надсилає користувачу дані про приєднання до організації ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>


- ID: bobr.ORGANIZATION.003

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ORGANIZATION.003
             <font color=000 size=10><b>НАЗВА:</b> Отримати дані про організацію
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.001
                <font color=000 size=10>bobr.DATA.EX.002
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b>Дані про організацію
         end header

         |Користувач|
             start
             : Запитує дані про організацію ;

         |Система|
             : Перевіряє, чи існує організація ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.001</b>
             end note

             : Знаходить дані про організацію ;

             : Авторизує користувача для отримання даних про організацію ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.002</b>
             end note

             : Надсилає користувачу дані про організацію ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>

- ID: bobr.ORGANIZATION.004

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.ORGANIZATION.004
             <font color=000 size=10><b>НАЗВА:</b>  Змінити дані про організацію
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>Користувач авторизований у системі.
             <font color=000 size=10>Користувач має доступ до запитаної організації.
             <font color=000 size=10><b>ВИКЛЮЧНІ СИТУАЦІЇ:</b>
                <font color=000 size=10>bobr.DATA.EX.001
                <font color=000 size=10>bobr.DATA.EX.002
                <font color=000 size=10>bobr.DATA.EX.003
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b>Дані про організацію
         end header

         |Користувач|
             start
             : Запитує зміну даних про організацію ;

         |Система|
             : Перевіряє, чи існує організація (можлива bobr.DATA.EX.001) ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.001</b>
             end note

             : Знаходить дані про організацію ;

             : Надає користувачу форму для заповнення змінених даних про організацію ;

         |Користувач|
             : Заповнює форму зміненими даними ;

         |Система|
             : Перевіряє правильність надісланих даних ;

             note right #ff0000
             <b>Можлива</b>
             <b>bobr.DATA.EX.003</b>
             end note

             : Змінює дані про організацію ;

             : Надсилає користувачу повідомлення про зміну даних організації ;

         |Користувач|
             : Завершує взаємодію ;
             stop;

  @enduml

    </center>

## Виключні випадки
<br><br>  
- ID: bobr.NOT_LOGGED.EX.001
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">
  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.NOT_LOGGED.EX.001
             <font color=000 size=10><b>НАЗВА:</b> Відхилити запит на реєстрацію
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач не зареєстрований у системі.
             <font color=000 size=10>Клієнт надіслав хибні дані реєстрації.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про відхилення реєстрації.
        end header
        |Система|
             start
             : Надає користувачу повідомлення про відхилення реєстрації ;

         |Користувач|
             : Отримує повідомлення про відхилення реєстрації ;

         |Система|
             : Завершує взаємодію ;

             stop;
    @enduml

    </center>

- ID: bobr.NOT_LOGGED.EX.002
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">
  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.NOT_LOGGED.EX.002
             <font color=000 size=10><b>НАЗВА:</b> Відхилити спробу авторизації через помилку ідентифікації
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач не авторизований у системі.
             <font color=000 size=10>Система не змогла ідентифікувати користувача.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про помилку спроби авторизації
        end header
        |Система|
             start
             : Надає користувачу повідомлення про відхилення авторизації через помилку ідентифікації ;

         |Користувач|
             : Отримує повідомлення про відхилення авторизації через помлку ідентифікації ;

         |Система|
             : Завершує взаємодію ;

             stop;
    @enduml

    </center>

- ID: bobr.NOT_LOGGED.EX.003
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">
  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.NOT_LOGGED.EX.003
             <font color=000 size=10><b>НАЗВА:</b> Відхилити спробу авторизації через помилку аутентифікації
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Клієнт не авторизований у системі.
             <font color=000 size=10>Система не змогла аутентифікувати користувача.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b>  Повідомлення про спроби авторизації
        end header
        |Система|
             start
             : Надає користувачу повідомлення про відхилення авторизації через помилку аутентифікації ;

         |Користувач|
             : Отримує повідомлення про відхилення авторизації через помилку аутентифікації ;

         |Система|
             : Завершує взаємодію ;

             stop;
    @enduml

    </center>

- ID: bobr.NOT_LOGGED.EX.004
    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">
  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.NOT_LOGGED.EX.004
             <font color=000 size=10><b>НАЗВА:</b> Відхилити доступ для неавторизованого користувача
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач не авторизований у системі.
             <font color=000 size=10>Система відхилила запит неавторизованого користувача.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b>  Повідомлення про відхиленя доступу для неавторизованого користувача
        end header
        |Система|
             start
             : Надає користувачу повідомлення про відхиленя доступу для неавторизованого користувача ;

         |Користувач|
             : Отримує повідомлення про відхиленя доступу для неавторизованого користувача ;

         |Система|
             : Завершує взаємодію ;

             stop;
    @enduml

    </center>

- ID: bobr.DATA.EX.001
<center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">
  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.DATA.EX.001
             <font color=000 size=10><b>НАЗВА:</b> Повідомити про відсутність запитаних даних
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач запитав дані, що відсутні у системі.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про відсутність запитаних даних.
         end header

         |Користувач|
             start
             : Запитує дані, що відсутні у системі ;

         |Система|
             : Надає користувачу повідомлення про відсутність запитаних даних ;

         |Користувач|
             : Отримує повідомлення ;

             : Завершує взаємодію ;

             stop;

  @enduml

    </center>

- ID: bobr.DATA.EX.002

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.DATA.EX.002
             <font color=000 size=10><b>НАЗВА:</b> Відхилити доступ користувача до даних.
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Система відхилила запит користувача до даних.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про відхилення доступу до даних.
         end header

         |Користувач|
             start
             : Надсилає запит на отримання даних, до яких в нього немає доступу ;

         |Система|
             : Надає користувачу повідомлення про відхилення доступу до даних ;

         |Користувач|
             : Отримує повідомлення ;

             : Завершує взаємодію ;

             stop;

  @enduml

    </center>

- ID: bobr.DATA.EX.003

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

  @startuml

        left header
             <font color=000 size=10><b>ID:</b> bobr.DATA.EX.003
             <font color=000 size=10><b>НАЗВА:</b> Відхилити хибні дані
             <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
             <font color=000 size=10><b>ПЕРЕДУМОВИ:</b>
             <font color=000 size=10>Користувач авторизований у системі.
             <font color=000 size=10>Користувач надіслав у систему хибні дані.
             <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про відхилення хибних даних.
         end header

         |Користувач|
             start
             : Надсилає у систему хибні дані ;

         |Система|
             : Надає користувачу повідомлення про відхилення хибних даних ;

         |Користувач|
             : Отримує повідомлення ;

             : Завершує взаємодію ;

             stop;

  @enduml

    </center>

- ID: bobr.MONEY.EX.001

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

    @startuml

        left header
            <font color=000 size=10><b>ID:</b> bobr.MONEY.EX.001
            <font color=000 size=10><b>НАЗВА:</b> Невірні платіжні дані
            <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
            <font color=000 size=10><b>ПЕРЕДУМОВИ:</b> 
            <font color=000 size=10> Користувач авторизований у системі.
            <font color=000 size=10> Користувач надіслав у систему невірні платіжні дані.
            <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про відхилення оплати
        end header

        |Користувач|
            start
            :Вводить хибні платіжні дані;

        |Система|
            :Надає користувачу повідомлення про відхилення оплати;

        |Користувач|
            :Отримує повідомлення;

        |Система|
            :Завершує взаємодію;
            stop

    @enduml

    </center>

- ID: bobr.MONEY.EX.002

    <center style="border-radius:4px; border: 1px solid #cfd7e6; box-shadow: 0 1px 3px 0 rgba(89,105,129,.05), 0 1px 1px 0 rgba(0,0,0,.025); padding: 1em;">

    @startuml

        left header
            <font color=000 size=10><b>ID:</b> bobr.MONEY.EX.002
            <font color=000 size=10><b>НАЗВА:</b> На рахунку платника недостатня кількість коштів
            <font color=000 size=10><b>УЧАСНИКИ:</b> Користувач, Система
            <font color=000 size=10><b>ПЕРЕДУМОВИ:</b> 
            <font color=000 size=10> Користувач авторизований у системі.
            <font color=000 size=10> Користувач надіслав у систему платіжні дані з недостатньою кількістю коштів.
            <font color=000 size=10><b>РЕЗУЛЬТАТ:</b> Повідомлення про відхилення оплати
        end header

        |Користувач|
            start
            :Вводить реквізити, за якими недостатньо коштів;

        |Система|
            :Надає користувачу повідомлення про відхилення оплати через недостатню кількість коштів;

        |Користувач|
            :Отримує повідомлення;

        |Система|
            :Завершує взаємодію;
            stop

    @enduml

    </center>