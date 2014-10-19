<%@ page import="de.dewarim.rock.Score" %>



<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'person', 'error')} required">
	<label for="person">
		<g:message code="score.person.label" default="Person" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="person" name="person.id" from="${de.dewarim.rock.Person.list()}" optionKey="id" required="" value="${scoreInstance?.person?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'points', 'error')} required">
	<label for="points">
		<g:message code="score.points.label" default="Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="points" type="number" value="${scoreInstance.points}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="score.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${scoreInstance.ranking}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'song', 'error')} required">
	<label for="song">
		<g:message code="score.song.label" default="Song" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="song" name="song.id" from="${de.dewarim.rock.Song.list()}" optionKey="id" required="" value="${scoreInstance?.song?.id}" class="many-to-one"/>

</div>

