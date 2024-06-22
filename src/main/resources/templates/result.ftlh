<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="smart-wrap">
        <div class="smart-forms smart-container wrap-0">
            <div class="form-body smart-steps stp-four">
                <div class="section">

<#--                    <div class="notification alert-warning spacer-t10">-->
<#--                        <p>Текущее состояние: <b>В обработке | Переоформление на другой факультет</b></p>-->
<#--                        <!-- <a href="#" class="close-btn">&times;</a>                                   &ndash;&gt;-->
<#--                    </div><!-- end .notification section &ndash;&gt;-->

<#--                    <div class="notification alert-info spacer-t10">-->
<#--                        <p>Текущее состояние: <b>Участие в конкурсе на факультете английского языка - Современные иностранные языки (Преподавание)(бюджетная форма)</b></p>-->
<#--                    </div><!-- end .notification section &ndash;&gt;-->

<#--                    <div class="notification alert-success spacer-t10">-->
<#--                        <p>Текущее состояние: <b>Рекомендация к зачислению!</b></p>-->
<#--                    </div><!-- end .notification section &ndash;&gt;-->

<#--                    <div class="notification alert-error spacer-t10">-->
<#--                        <p>Текущее состояние: <b>Непрохождение по конкурсу. Возможность переподачи документов на платную форму</b></p>-->
<#--                    </div><!-- end .notification section &ndash;&gt;-->
                </div><!-- end .section section -->
                <div class="spacer-b30 spacer-t40">
                    <div class="tagline">
                        <span>Памятка абитуриенту при поступлении</span>
                    </div>
                </div>
                <div class="section">
                    <p class="align-center">Уважаемый абитуриент!</p>
                    <p>Для участия в конкурсе на получение образования Вам необходимо <u>ЛИЧНО</u> подать следующие документы в приемную комиссию исходя из заполненной Вами анкеты в следующем порядке:</p>
                    <ol>
                        <li>Распечатанное <a href="/apply-form">заявление</a> для участия в конкурсе.</li>
                        <li>Распечатанный <a href="/contract-form">договор</a> на обучение.</li>
                        <li>Распечатанная <a href="/anketa-form">анкета абитуриента</a>.</li>
                        <li>Фото 3х4 (4 шт.)</li>
                        <li>Медицинская справка установленной формы.</li>
                        <li>Документ об образовании (аттестат/диплом) №${profile.docEduNumber} от ${profile.docEduDate?datetime("yyyy-MM-dd")?string("dd.MM.yyyy")}г.</li>
                        <#if profile.foreignLanguage??><li>Сертификат централизованного тестирования по предмету "<b>${profile.foreignLanguage.fullName}</b>" <#if profile.foreignLanguageCode??>№${profile.foreignLanguageCode}</#if></li></#if>
                        <#if profile.stateLanguage??><li>Сертификат централизованного тестирования по предмету "<b>${profile.stateLanguage.fullName}</b>" <#if profile.stateLanguageCode??>№${profile.stateLanguageCode}</#if></li></#if>
                        <#if profile.historyCode??><li>Сертификат централизованного тестирования по предмету "<b>История</b>" <#if profile.historyCode??>№${profile.historyCode}</#if></li></#if>
                        <li>(Список документов, предоставляющих льготы при поступлении.)</li>
                    </ol>
                    <p>В удобное для Вас время, согласованное с приемной комиссией по тел. +375 (33) 611-30-27, мы ждём Вас по адресу г.Минск, ул.Захарова, 21.</p>
                </div>
                <#if profile.photoFile?has_content>
                    <div class="frm-row">
                        <div class="section colm colm12 align-center">
                            <h3>Ваша фотография, представленная в приемную комиссию: </h3>
                        </div>
                        <div class="section colm colm12 align-center">
                            <img src="/img/${profile.photoFile}" height="200px">
                        </div>
                    </div>
                </#if>
                <div class="section">
                    <div class="map-container">
                        <div id="map_canvas">
                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d7905.451991906568!2d27.582702557594125!3d53.90855696668736!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x0%3A0x7664ab9ac9e0377c!2z0JzQuNC90YHQutC40Lkg0JPQvtGB0YPQtNCw0YDRgdGC0LLQtdC90L3Ri9C5INCb0LjQvdCz0LLQuNGB0YLQuNGH0LXRgdC60LjQuSDRg9C90LjQstC10YDRgdC40YLQtdGC!5e0!3m2!1sru!2sby!4v1594815494527!5m2!1sru!2sby" width="100%" height="100%" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
                        </div>
                    </div><!-- end .map-container -->
                </div><!-- end .section -->
                <div class="spacer-b30 spacer-t40">
                    <div class="tagline">
                        <span>Памятка абитуриенту при переподаче документов на другую специальность</span>
                    </div>
                </div>
                <div class="section">
                    <p class="align-center">Уважаемый абитуриент!</p>
                    <p>Для переподачи документов на получение образования Вам необходимо выполнить действия в следующем порядке:</p>
                    <ol>
                        <li>Изменить данные о факультете и специальности, на которую Вы хотите переподать документы, в технической комиссии выбранного факультета по тел. +375 (33) 611-30-27</li>
                        <li>Распечатать заявление и анкету на новую специальность.</li>
                        <li><b><u>ЛИЧНО</u></b> прийти в приемную комиссию с заявлением, анкетой, распиской о принятии документов во время согласованное по номеру тел. +375 (33) 611-30-27.</li>
                    </ol>
                </div>
                <div class="section align-center">
                    <h2>Желаем Вам удачи в конкурсе на поступление в лучший ВУЗ нашей страны!</h2>
                </div>
            </div>
        </div>
    </div>
</@c.page>