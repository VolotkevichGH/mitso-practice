<#import "parts/common.ftlh" as c>
<#import "parts/login.ftlh" as l>
<@c.page>
    <div>Список пользователей</div>
    <table>
        <thead>
            <th>Name</th>
            <th>Role</th>
        </thead>
        <tbody>
            <#list users as user>
                <tr>
                    <td>${user.email}</td>
                    <td><#list user.roles as role>${role}<#sep>, </#list></td>
                    <td><a href="/user/${user.id}">edit</a></td>
                </tr>
            </#list>
        </tbody>

    </table>


    <@l.logout />

</@c.page>