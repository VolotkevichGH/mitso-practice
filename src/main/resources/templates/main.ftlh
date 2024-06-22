<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-0">
            <div class="form-body smart-steps stp-four">
                <h2 class="align-center">Добро пожаловать в систему "Абитуриент МГЛУ"!</h2>
                <div class="section colm colm12">
                    <p class="align-center">Уважаемый абитуриент!</p>
                    <p>Для успешной подачи документов в приемную комиссию МГЛУ Вам необходимо выполнить следующие действия:</p>
                    <ol>
                        <li>Зарегистрироваться в личном кабинете абитуриента.
                            <ul>
                                <li>Подтвердить адрес электронной почты (пройти по ссылке активации, которая будет отправлена на указанный Вами адрес электронной почты</li>
                                <li>Войти в личный кабинет и заполнить форму анкеты абитуриента МГЛУ</li>
                            </ul>
                        </li>
                        <li>Распечатать документы (заявление, анкета, договор на обучение в случае прохождения по конкурсу (в 2-х экземплярах для бюджетной формы, в 3-х экземплярах для платной формы).</li>
                        <li>Согласовать дату и время личной подачи документов в приемную комиссию выбранного факультета по многоканальному тел. +375 (33) 611-30-27</li>
                        <li>Приехать в приемную комиссию ЛИЧНО в назначенное время с полным пакетом требуемых документов.</li>
                    </ol>
                </div>
                <p class="align-center"><strong>Выберите действие для продолжения</strong></p>
                <div class="frm-row">
                    <div class="section colm colm6">
                        <a href="/login" class="button btn-primary block pushed expand"> Войти </a>
                    </div>
                    <div class="section colm colm6">
                        <a href="/registration" class="button btn-primary block pushed expand"> Зарегистрироваться </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</@c.page>