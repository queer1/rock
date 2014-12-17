<%@ page import="de.dewarim.rock.Band" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'band.label', default: 'Band')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-band" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                              args="[entityName]"/></g:link></li>
    </ul>
</div>

<div id="show-band" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list band">

        <g:if test="${bandInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="band.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${bandInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <li class="fieldcontain">
            <span id="songs-label" class="property-label"><g:message code="band.songs.label" default="Songs"/></span>

            <g:each in="${bandInstance.songs}" var="s">
                <span class="property-value" aria-labelledby="songs-label"><g:link controller="song" action="show"
                                                                                   id="${s.id}">${s?.name}</g:link></span>
            </g:each>

        </li>

    </ol>
    <sec:ifAllGranted roles="ROLE_ADMIN">
        <g:form url="[resource: bandInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${bandInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
                <g:link controller="song" action="create"
                        params="['band.id': bandInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'song.label', default: 'Song')])}</g:link>

            </fieldset>
        </g:form>
    </sec:ifAllGranted>
</div>
</body>
</html>
