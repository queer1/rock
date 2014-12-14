<%@ page import="de.dewarim.rock.Song" %>



<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'year', 'error')} ">
	<label for="year">
		<g:message code="song.year.label" default="Year" />
		
	</label>
	<g:field name="year" type="number" value="${songInstance.year}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'tuning', 'error')} ">
	<label for="tuning">
		<g:message code="song.tuning.label" default="Tuning" />
		
	</label>
	<g:select id="tuning" name="tuning.id" from="${de.dewarim.rock.Tuning.list()}" optionValue="name" optionKey="id" value="${songInstance?.tuning?.id}" class="many-to-one" noSelection="['null': '']"/>

</div>

<div class="fieldcontain ${hasErrors(bean: songInstance, field: 'band', 'error')} required">
	<label for="band">
		<g:message code="song.band.label" default="Band" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="band" name="band.id" from="${de.dewarim.rock.Band.list()}" optionValue="name" optionKey="id" required="" value="${songInstance?.band?.id}" class="many-to-one"/>

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


</div>

