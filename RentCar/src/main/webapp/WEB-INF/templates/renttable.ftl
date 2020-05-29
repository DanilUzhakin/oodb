<thead>
<th>Номер</th><th>Машина</th>
</thead>
<tbody>
<#if model["Rents"]??>
    <#list model["Rents"] as rent>
        <tr>
            <td>
                <#if rent.id??>${rent.id}</#if>
            </td>
            <td><#if rent.rentcar??>${rent.rentcar}</#if></td>
            <td>
                <#if rent.id??><button style="color: red", onclick="delete_rent(${rent.id})">X</button></#if>
            </td>
        </tr>
    </#list>
</#if>
</tbody>