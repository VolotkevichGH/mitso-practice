<#import "login.ftlh" as l>

<#macro page>
    <!DOCTYPE html>
    <html lang="ru">
    <head>
        <title>Система "Абитуриент МГЛУ"</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/normalize/8.0.1/normalize.min.css" />
        <link rel="stylesheet" type="text/css"  href="/css/smart-forms.css">
        <link rel="stylesheet" type="text/css"  href="/css/font-awesome.min.css">
        <link rel="stylesheet" type="text/css"  href="/css/smart-addons.css">
        <script type="text/javascript" src="/js/jquery-3.5.1.min.js"></script>
        <script type="text/javascript" src="/js/jquery.steps.min.js"></script>
        <script type="text/javascript" src="/js/jquery-ui-custom.min.js"></script>
        <script type="text/javascript" src="/js/jquery.validate.min.js"></script>
        <script type="text/javascript" src="/js/jquery.formShowHide.min.js"></script>
        <script type="text/javascript" src="/js/jquery.chained.min.js"></script>
        <script type="text/javascript" src="/js/additional-methods.min.js"></script>
        <script type="text/javascript" src="/js/jquery.form.min.js"></script>
        <script type="text/javascript" src="/js/select2.full.min.js"></script>
        <script type="text/javascript" src="/js/intlTelInput.min.js"></script>
        <script type="text/javascript" src="/js/datepicker-ru.js" ></script>
        <script type="text/javascript" src="/js/smartforms-modal.min.js" ></script>
        <script type="text/javascript" src="/js/smart-form.js"></script>
        <script src="https://www.google.com/recaptcha/api.js?hl=ru" async defer></script>
        <script type="text/javascript">
            function navMobileToggler() {
                var mobileMenu = document.getElementById("mobile-menu");
                if (mobileMenu.style.display === "block") {
                    mobileMenu.style.display = "none";
                } else {
                    mobileMenu.style.display = "block";
                }
            }
        </script>

    </head>

    <body>
    <header>
        <div class="logo__wrapper">
            <img class="logo" src="/images/logo.png" alt="logo">
            <h1 class="title">Система "Абитуриент"</h1>
        </div>
        <#if user??>
            <#if user?? && user.email??><@l.logout userEmail="${user.email}" /><#else><@l.login /></#if>
            <#else><@l.login />
        </#if>
    </header>
    <main class="main">
        <#nested>
    </main>
    <footer class="footer">
        <h3 class="copyright">© Минский государственный лингвистический университет</h3>
    </footer>
    </body>
</html>
</#macro>

<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}">
        <input type="submit" value="Sign Out"/>
    </form>
</#macro>