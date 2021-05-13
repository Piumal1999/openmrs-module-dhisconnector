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

<form method="post">
    <br />
    <table>
        <thead>
        <tr>
            <th><spring:message code="dhisconnector.automation.location"/></th>
            <th><spring:message code="dhisconnector.automation.orgUnit"/></th>
        </tr>
        </thead>
        <tbody>
        <tr class="evenRow">
            <td>
                <select name="location">
                    <option></option>
                    <c:forEach items="${locations}" var="location">
                        <option value="${location.uuid}">${location.name}</option>
                    </c:forEach>
                </select>
            </td>
            <td>
                <select name="orgUnit">
                    <option></option>
                    <c:forEach items="${orgUnits}" var="orgUnit">
                        <option value="${orgUnit.id}">${orgUnit.name}</option>
                    </c:forEach>
                </select>
            </td>
            <td></td>
        </tr>
        <c:forEach items="${locationToOrgUnitMappings}" var="mpg">
            <tr class="evenRow">
                <td>${mpg.location.name}</td>
                <td>${orgUnitsByIds[mpg.orgUnitUid]}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
    <input type="submit" value="<spring:message code='dhisconnector.automation.submit'/>">
</form>

<%@ include file="/WEB-INF/template/footer.jsp" %>
<%@ include file="jembiOpenMRSFooter.jsp" %>
