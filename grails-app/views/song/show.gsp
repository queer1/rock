<%@ page import="de.dewarim.rock.Song" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'song.label', default: 'Song')}"/>
    <title><g:message code="default.show.label" args="[entityName]"/></title>
</head>

<body>
<a href="#show-song" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                           default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]"/></g:link></li>
        <sec:ifAllGranted roles="ROLE_ADMIN">
            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </sec:ifAllGranted>
    </ul>
</div>

<div id="show-song" class="content scaffold-show" role="main">
    <h1><g:message code="default.show.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <ol class="property-list song">

        <g:if test="${songInstance?.name}">
            <li class="fieldcontain">
                <span id="name-label" class="property-label"><g:message code="song.name.label" default="Name"/></span>

                <span class="property-value" aria-labelledby="name-label"><g:fieldValue bean="${songInstance}"
                                                                                        field="name"/></span>

            </li>
        </g:if>

        <g:if test="${songInstance?.band}">
            <li class="fieldcontain">
                <span id="band-label" class="property-label"><g:message code="song.band.label" default="Band"/></span>

                <span class="property-value" aria-labelledby="band-label"><g:link controller="band" action="show"
                                                                                  id="${songInstance?.band?.id}">${songInstance?.band?.name}</g:link></span>

            </li>
        </g:if>

        <g:if test="${songInstance?.year}">
            <li class="fieldcontain">
                <span id="year-label" class="property-label"><g:message code="song.year.label" default="Year"/></span>

                <span class="property-value" aria-labelledby="year-label">${songInstance.year}</span>

            </li>
        </g:if>



        <g:if test="${songInstance?.tuning}">
            <li class="fieldcontain">
                <span id="tuning-label" class="property-label"><g:message code="song.tuning.label"
                                                                          default="Tuning"/></span>

                <span class="property-value" aria-labelledby="tuning-label"><g:link controller="tuning" action="show"
                                                                                    id="${songInstance?.tuning?.id}">${songInstance?.tuning?.name}</g:link></span>

            </li>
        </g:if>

        <g:if test="${songInstance?.playedArcade}">
            <li class="fieldcontain">
                <span id="playedArcade-label" class="property-label"><g:message code="song.playedArcade.label"
                                                                                default="Played Arcade"/></span>

                <span class="property-value" aria-labelledby="playedArcade-label"><g:fieldValue bean="${songInstance}"
                                                                                                field="playedArcade"/></span>

            </li>
        </g:if>

        <g:if test="${songInstance?.playedNormal}">
            <li class="fieldcontain">
                <span id="playedNormal-label" class="property-label"><g:message code="song.playedNormal.label"
                                                                                default="Played Normal"/></span>

                <span class="property-value" aria-labelledby="playedNormal-label"><g:fieldValue bean="${songInstance}"
                                                                                                field="playedNormal"/></span>

            </li>
        </g:if>

        <g:if test="${songInstance?.scores}">
            <li class="fieldcontain">
                <span id="scores-label" class="property-label"><g:message code="song.scores.label"
                                                                          default="Scores"/></span>

                <g:each in="${songInstance.scores}" var="s">
                    <span class="property-value" aria-labelledby="scores-label"><g:link controller="score" action="show"
                                                                                        id="${s.id}">${s?.encodeAsHTML()}</g:link></span>
                </g:each>

            </li>
        </g:if>

    </ol>
    <sec:ifAllGranted roles="ROLE_ADMIN">
        <g:form url="[resource: songInstance, action: 'delete']" method="DELETE">
            <fieldset class="buttons">
                <g:link class="edit" action="edit" resource="${songInstance}"><g:message
                        code="default.button.edit.label" default="Edit"/></g:link>
                <g:actionSubmit class="delete" action="delete"
                                value="${message(code: 'default.button.delete.label', default: 'Delete')}"
                                onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');"/>
            </fieldset>
        </g:form>
    </sec:ifAllGranted>
</div>
</body>
</html>
