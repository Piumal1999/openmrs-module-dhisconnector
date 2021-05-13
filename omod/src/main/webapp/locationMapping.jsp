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

<c:forEach items="${locations}" var="location">
  <p>${location}</p>
</c:forEach>

<c:forEach items="${orgunits}" var="orgunit">
    <p>${orgunit.name}</p>
</c:forEach>

<%--<div id="loading-progress-bar"></div>--%>
<%--<input id="create-location-mapping-action" type="hidden" value="new">--%>
<%--<div class="error-encountered" id="error-encountered-saving"></div>--%>
<%--<p>--%>
<%--<div class="row">--%>
<%--  <div class="col-xs-5">--%>
<%--    <div class="box" id="locations"><img class="spinner" src="../../moduleResources/dhisconnector/loading.gif"/></div>--%>
<%--  </div>--%>
<%--  <div class="col-xs">--%>
<%--    <div class="box" id="orgunits"><img class="spinner" src="../../moduleResources/dhisconnector/loading.gif"/></div>--%>
<%--  </div>--%>
<%--</div>--%>
<%--</p>--%>

<%--<p>--%>
<%--<div class="row real-mapping-section">--%>
<%--  <div class="col-xs-5" id="location"></div>--%>
<%--  <div class="col-xs" id="orgmapping"></div>--%>
<%--  <div class="col-xs" id="orgunit"></div>--%>
<%--</div>--%>
<%--</p>--%>

<%--<p>--%>
<%--  <button id="postLocationMappingObject" onClick="saveLocationMappings(event)"><spring:message code="dhisconnector.save"/></button>--%>
<%--</p>--%>

<%@ include file="/WEB-INF/template/footer.jsp" %>
<%@ include file="jembiOpenMRSFooter.jsp" %>
