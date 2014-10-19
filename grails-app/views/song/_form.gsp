<%@ page import="de.dewarim.rock.Song" %>



<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'band', 'error')} required">
	<label for="band">
		<g:message code="song.band.label" default="Band" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="band" name="band.id" from="${de.dewarim.rock.Band.list()}" optionKey="id" required="" value="${songInstance?.band?.id}" class="many-to-one"/>

</div>

<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="song.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${songInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'playedArcade', 'error')} required">
	<label for="playedArcade">
		<g:message code="song.playedArcade.label" default="Played Arcade" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playedArcade" type="number" value="${songInstance.playedArcade}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'playedNormal', 'error')} required">
	<label for="playedNormal">
		<g:message code="song.playedNormal.label" default="Played Normal" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="playedNormal" type="number" value="${songInstance.playedNormal}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'scores', 'error')} ">
	<label for="scores">
		<g:message code="song.scores.label" default="Scores" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${songInstance?.scores?}" var="s">
    <li><g:link controller="score" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="score" action="create" params="['song.id': songInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'score.label', default: 'Score')])}</g:link>
</li>
</ul>


</div>

