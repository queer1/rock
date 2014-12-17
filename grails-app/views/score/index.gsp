<%@ page import="de.dewarim.rock.Score" %>
<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="main">
    <g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}"/>
    <title><g:message code="default.list.label" args="[entityName]"/></title>
</head>

<body>
<a href="#list-score" class="skip" tabindex="-1"><g:message code="default.link.skip.label"
                                                            default="Skip to content&hellip;"/></a>

<div class="nav" role="navigation">
    <ul>
        <li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
        <sec:ifAllGranted roles="ROLE_USER">

            <li><g:link class="create" action="create"><g:message code="default.new.label"
                                                                  args="[entityName]"/></g:link></li>
        </sec:ifAllGranted>
    </ul>
</div>

<div id="list-score" class="content scaffold-list" role="main">
    <h1><g:message code="default.list.label" args="[entityName]"/></h1>
    <g:if test="${flash.message}">
        <div class="message" role="status">${flash.message}</div>
    </g:if>
    <table>
        <thead>
        <tr>

            <th><g:message code="score.song.label" default="Song"/></th>

            <g:sortableColumn property="abilityTimesTen"
                              title="${message(code: 'score.abilityTimesTen.label', default: 'Ability')}"/>

            <g:sortableColumn property="dateCreated"
                              title="${message(code: 'score.dateCreated.label', default: 'Date Created')}"/>

            <g:sortableColumn property="instrumentType"
                              title="${message(code: 'score.instrumentType.label', default: 'Instrument Type')}"/>

            <g:sortableColumn property="longestStreak"
                              title="${message(code: 'score.longestStreak.label', default: 'Longest Streak')}"/>

            <th><g:message code="score.person.label" default="Person"/></th>

            <g:sortableColumn property="points" title="${message(code: 'score.points.label', default: 'Points')}"/>

            <g:sortableColumn property="ranking" title="${message(code: 'score.ranking.label', default: 'Ranking')}"/>

        </tr>
        </thead>
        <tbody>
        <g:each in="${scoreInstanceList}" status="i" var="scoreInstance">
            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

                <td></td>

                <td><g:link action="show"
                            id="${scoreInstance.id}">${fieldValue(bean: scoreInstance, field: "song.name")}</g:link></td>

                <td><g:formatNumber maxFractionDigits="2"
                                    number="${scoreInstance?.abilityTimesTen ? scoreInstance.abilityTimesTen / 10 : 0}"/></td>

                <td><g:formatDate date="${scoreInstance.dateCreated}"/></td>

                <td>${fieldValue(bean: scoreInstance, field: "instrumentType")}</td>

                <td>${fieldValue(bean: scoreInstance, field: "longestStreak")}</td>

                <td>${fieldValue(bean: scoreInstance, field: "person.username")}</td>

                <td>${fieldValue(bean: scoreInstance, field: "points")}</td>

                <td>${fieldValue(bean: scoreInstance, field: "ranking")}</td>

            </tr>
        </g:each>
        </tbody>
    </table>

    <div class="pagination">
        <g:paginate total="${scoreInstanceCount ?: 0}"/>
    </div>
</div>
</body>
</html>
