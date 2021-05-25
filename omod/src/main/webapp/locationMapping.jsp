<%@ include file="/WEB-INF/template/include.jsp" %>
<%@ include file="/WEB-INF/template/header.jsp" %>

<openmrs:htmlInclude file="/moduleResources/dhisconnector/flexboxgrid.min.css"/>
<openmrs:htmlInclude file="/moduleResources/dhisconnector/dragula.min.css"/>
<openmrs:htmlInclude file="/moduleResources/dhisconnector/dhisconnector.css"/>
<openmrs:htmlInclude file="/moduleResources/dhisconnector/dragula.min.js"/>
<openmrs:htmlInclude file="/moduleResources/dhisconnector/dhisconnector.js"/>

<%@ include file="template/localHeader.jsp" %>

<c:if test="${showLogin == 'true'}">
	<c:redirect url="../../login.htm" />
</c:if>

<h3><spring:message code="dhisconnector.locationMapping"/></h3>
<h4></h4>

<%--<form method="post">--%>
<%--    <br />--%>
<%--    <table>--%>
<%--        <thead>--%>
<%--        <tr>--%>
<%--            <th><spring:message code="dhisconnector.automation.location"/></th>--%>
<%--            <th><spring:message code="dhisconnector.automation.orgUnit"/></th>--%>
<%--        </tr>--%>
<%--        </thead>--%>
<%--        <tbody>--%>
<%--        <tr class="evenRow">--%>
<%--            <td>--%>
<%--                <select name="location">--%>
<%--                    <option></option>--%>
<%--                    <c:forEach items="${locations}" var="location">--%>
<%--                        <option value="${location.uuid}">${location.name}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--            <td>--%>
<%--                <select name="orgUnit">--%>
<%--                    <option></option>--%>
<%--                    <c:forEach items="${orgUnits}" var="orgUnit">--%>
<%--                        <option value="${orgUnit.id}">${orgUnit.name}</option>--%>
<%--                    </c:forEach>--%>
<%--                </select>--%>
<%--            </td>--%>
<%--            <td></td>--%>
<%--        </tr>--%>
<%--        <c:forEach items="${locationToOrgUnitMappings}" var="mpg">--%>
<%--            <tr class="evenRow">--%>
<%--                <td>${mpg.location.name}</td>--%>
<%--                <td>${orgUnitsByIds[mpg.orgUnitUid]}</td>--%>
<%--            </tr>--%>
<%--        </c:forEach>--%>
<%--        </tbody>--%>
<%--    </table>--%>
<%--    <input type="submit" value="<spring:message code='dhisconnector.automation.submit'/>">--%>
<%--</form>--%>

<form method="post" onsubmit="getLocMappings()">
    <input name="locMappings" type="hidden" value="">
    <table id="mapTable">
        <c:forEach items="${locations}" var="location">
            <tr class="evenRow">

                <td id="location_${location.uuid}">
                        ${location.name}
                </td>

                <c:set value="" var="savedOrgUnitUuid"/>
                <c:forEach items="${locationToOrgUnitMappings}" var="locationToOrgUnitMapping">
                    <c:if test="${location.id == locationToOrgUnitMapping.location.id}">
                        <c:set value="${locationToOrgUnitMapping.orgUnitUid}" var="savedOrgUnitUuid"/>
                    </c:if>
                </c:forEach>

                <td>
                <select name="orgUnitOf_${location.uuid}" >

                    <option></option>

                    <c:forEach items="${orgUnits}" var="orgUnit">

                        <c:set value="" var="isSelected"/>
                        <c:if test="${orgUnit.id == savedOrgUnitUuid}">
                            <c:set value="selected" var="isSelected"/>
                        </c:if>

                        <option ${isSelected} value="${orgUnit.id}" >${orgUnit.name}</option>

                    </c:forEach>
                </select>
                </td>

            </tr>
        </c:forEach>
    </table>
    <input type="submit" value="submit" />
</form>

<script type="application/javascript">
    function getLocMappings() {
        let locationMappings = "";
        jq("td[id^='location_']").each(function() {
            let location = this.id;
            let locationUuid = location.substr(9);
            if (jq("[name='orgUnitOf_"+locationUuid+"']").val() != ""){
                locationMappings = locationMappings + locationUuid + "=" + jq("[name='orgUnitOf_"+locationUuid+"']").val() + ",";
            }
        })
        jq("input[name='locMappings']").val(locationMappings);
        console.log(jq("input[name='locMappings']").val());
    }
</script>

<%@ include file="/WEB-INF/template/footer.jsp" %>
<%@ include file="jembiOpenMRSFooter.jsp" %>
