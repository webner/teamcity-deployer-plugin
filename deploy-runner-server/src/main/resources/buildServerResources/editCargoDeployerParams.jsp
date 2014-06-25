<%@ page import="jetbrains.buildServer.deployer.common.DeployerRunnerConstants" %>
<%@ page import="org.codehaus.cargo.generic.DefaultContainerFactory" %>
<%@ page import="org.codehaus.cargo.container.ContainerType" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Map" %>
<%@ taglib prefix="props" tagdir="/WEB-INF/tags/props" %>
<%@ taglib prefix="l" tagdir="/WEB-INF/tags/layout" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="forms" tagdir="/WEB-INF/tags/forms" %>
<%@ taglib prefix="bs" tagdir="/WEB-INF/tags" %>

<l:settingsGroup title="Deployment Target">
    <tr>
        <th><label for="jetbrains.buildServer.deployer.targetUrl">Target: <l:star/></label></th>
        <td><props:textProperty name="<%=DeployerRunnerConstants.PARAM_TARGET_URL%>"  className="longField" maxlength="256"/>
            <span class="smallNote">Enter target Tomcat server hostname or IP. "Manager" application must be installed on targer server</span><span class="error" id="error_jetbrains.buildServer.deployer.targetUrl"></span>
        </td>
    </tr>
    <tr>
        <th><label for="jetbrains.buildServer.deployer.container.type">Target: <l:star/></label></th>
        <td>
            <props:selectProperty name="<%=DeployerRunnerConstants.PARAM_CONTAINER_TYPE%>">
            <%--    <c:forEach var="type" items="${runnerConst.transportTypeValues}">
                    <props:option value="${type.key}"><c:out value="${type.value}"/></props:option>
                </c:forEach>  --%>
                <props:option value="tomcat7x">Tomcat 7x</props:option>
            </props:selectProperty>
            <span class="smallNote">Select type of remote container</span>
        </td>

    </tr>
</l:settingsGroup>

<l:settingsGroup title="Deployment Credentials">
    <tr>
        <th><label for="jetbrains.buildServer.deployer.username">Username:</label></th>
        <td><props:textProperty name="<%=DeployerRunnerConstants.PARAM_USERNAME%>"  className="longField" maxlength="256"/>
            <span class="smallNote">Enter username. The user must have "manager-script" role assigned</span>
        </td>
    </tr>
    <tr>
        <th><label for="secure:jetbrains.buildServer.deployer.password">Password:</label></th>
        <td><props:passwordProperty name="<%=DeployerRunnerConstants.PARAM_PASSWORD%>"  className="longField" maxlength="256"/>
            <span class="smallNote">Enter password. Configuration parameters can be used</span>
        </td>
    </tr>
</l:settingsGroup>

<l:settingsGroup title="Web Application Settings">
    <tr>
        <th><label for="jetbrains.buildServer.deployer.sourcePath">Path to war archive: </label></th>
        <td><props:textProperty name="<%=DeployerRunnerConstants.PARAM_SOURCE_PATH%>"  className="longField" maxlength="256"/>
            <span class="smallNote">Path to war archive to deploy</span>
        </td>
    </tr>
    <tr>
        <th><label for="jetbrains.buildServer.deployer.container.contextPath">Context path: </label></th>
        <td><props:textProperty name="<%=DeployerRunnerConstants.PARAM_CONTAINER_CONTEXT_PATH%>"  className="longField" maxlength="256"/>
            <span class="smallNote">Optional. Context path on server, defaults to war archive name</span>
        </td>
    </tr>
</l:settingsGroup>