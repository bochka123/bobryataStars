# Модель прецедентів

В цьому файлі необхідно перелічити всі документи, розроблені в проекті та дати посилання на них.

*Модель прецедентів повинна містити загальні оглядові діаграми та специфікації прецедентів.*



Вбудовування зображень діаграм здійснюється з використанням сервісу [plantuml.com](https://plantuml.com/). 

## Основні сценарії
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

