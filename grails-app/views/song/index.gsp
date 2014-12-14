
<%@ page import="de.dewarim.rock.Song" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'song.label', default: 'Song')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-song" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="list-song" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table>
			<thead>
					<tr>

						<g:sortableColumn property="name" title="${message(code: 'song.name.label', default: 'Name')}" />

						<g:sortableColumn property="band.name" titleKey="song.band.label" />
						<g:sortableColumn property="year" title="${message(code: 'song.year.label', default: 'Year')}" />

						<th><g:message code="song.tuning.label" default="Tuning" /></th>
					
						<g:sortableColumn property="playedArcade" title="${message(code: 'song.playedArcade.label', default: 'Played Arcade')}" />
					
						<g:sortableColumn property="playedNormal" title="${message(code: 'song.playedNormal.label', default: 'Played Normal')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${songInstanceList}" status="i" var="songInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${songInstance.id}">${fieldValue(bean: songInstance, field: "name")}</g:link></td>

						<td><g:link action="show" controller="band" id="${songInstance.band.id}">${fieldValue(bean: songInstance, field: "band.name")}</g:link></td>

						<td>${songInstance?.year} </td>
					
						<td>${fieldValue(bean: songInstance, field: "tuning")}</td>

						<td>${fieldValue(bean: songInstance, field: "playedArcade")}</td>
					
						<td>${fieldValue(bean: songInstance, field: "playedNormal")}</td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${songInstanceCount ?: 0}" />
			</div>
		</div>
	</body>
</html>
