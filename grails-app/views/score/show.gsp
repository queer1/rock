
<%@ page import="de.dewarim.rock.Score" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'score.label', default: 'Score')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-score" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-score" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list score">
			
				<g:if test="${scoreInstance?.abilityTimesTen}">
				<li class="fieldcontain">
					<span id="abilityTimesTen-label" class="property-label"><g:message code="score.abilityTimesTen.label" default="Ability Times Ten" /></span>
					
						<span class="property-value" aria-labelledby="abilityTimesTen-label"><g:fieldValue bean="${scoreInstance}" field="abilityTimesTen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.dateCreated}">
				<li class="fieldcontain">
					<span id="dateCreated-label" class="property-label"><g:message code="score.dateCreated.label" default="Date Created" /></span>
					
						<span class="property-value" aria-labelledby="dateCreated-label"><g:formatDate date="${scoreInstance?.dateCreated}" /></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.instrumentType}">
				<li class="fieldcontain">
					<span id="instrumentType-label" class="property-label"><g:message code="score.instrumentType.label" default="Instrument Type" /></span>
					
						<span class="property-value" aria-labelledby="instrumentType-label"><g:fieldValue bean="${scoreInstance}" field="instrumentType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.longestStreak}">
				<li class="fieldcontain">
					<span id="longestStreak-label" class="property-label"><g:message code="score.longestStreak.label" default="Longest Streak" /></span>
					
						<span class="property-value" aria-labelledby="longestStreak-label"><g:fieldValue bean="${scoreInstance}" field="longestStreak"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.person}">
				<li class="fieldcontain">
					<span id="person-label" class="property-label"><g:message code="score.person.label" default="Person" /></span>
					
						<span class="property-value" aria-labelledby="person-label"><g:link controller="person" action="show" id="${scoreInstance?.person?.id}">${scoreInstance?.person?.username?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.points}">
				<li class="fieldcontain">
					<span id="points-label" class="property-label"><g:message code="score.points.label" default="Points" /></span>
					
						<span class="property-value" aria-labelledby="points-label"><g:fieldValue bean="${scoreInstance}" field="points"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.precisionTimesTen}">
				<li class="fieldcontain">
					<span id="precisionTimesTen-label" class="property-label"><g:message code="score.precisionTimesTen.label" default="Precision Times Ten" /></span>
					
						<span class="property-value" aria-labelledby="precisionTimesTen-label"><g:fieldValue bean="${scoreInstance}" field="precisionTimesTen"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.ranking}">
				<li class="fieldcontain">
					<span id="ranking-label" class="property-label"><g:message code="score.ranking.label" default="Ranking" /></span>
					
						<span class="property-value" aria-labelledby="ranking-label"><g:fieldValue bean="${scoreInstance}" field="ranking"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.scoreType}">
				<li class="fieldcontain">
					<span id="scoreType-label" class="property-label"><g:message code="score.scoreType.label" default="Score Type" /></span>
					
						<span class="property-value" aria-labelledby="scoreType-label"><g:fieldValue bean="${scoreInstance}" field="scoreType"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${scoreInstance?.song}">
				<li class="fieldcontain">
					<span id="song-label" class="property-label"><g:message code="score.song.label" default="Song" /></span>
					
						<span class="property-value" aria-labelledby="song-label"><g:link controller="song" action="show" id="${scoreInstance?.song?.id}">${scoreInstance?.song?.encodeAsHTML()}</g:link></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:scoreInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${scoreInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
