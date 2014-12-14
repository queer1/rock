<%@ page import="de.dewarim.rock.Score" %>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'abilityTimesTen', 'error')} required">
	<label for="abilityTimesTen">
		<g:message code="score.abilityTimesTen.label" default="Ability" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="abilityTimesTen" type="number" value="${scoreInstance.abilityTimesTen}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'instrumentType', 'error')} required">
	<label for="instrumentType">
		<g:message code="score.instrumentType.label" default="Instrument Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="instrumentType" from="${de.dewarim.rock.InstrumentType?.values()}" keys="${de.dewarim.rock.InstrumentType.values()*.name()}" required="" value="${scoreInstance?.instrumentType?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'longestStreak', 'error')} required">
	<label for="longestStreak">
		<g:message code="score.longestStreak.label" default="Longest Streak" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="longestStreak" type="number" value="${scoreInstance.longestStreak}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'points', 'error')} required">
	<label for="points">
		<g:message code="score.points.label" default="Points" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="points" type="number" value="${scoreInstance.points}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'precisionTimesTen', 'error')} required">
	<label for="precisionTimesTen">
		<g:message code="score.precisionTimesTen.label" default="Precision" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="precisionTimesTen" type="number" value="${scoreInstance.precisionTimesTen}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'ranking', 'error')} required">
	<label for="ranking">
		<g:message code="score.ranking.label" default="Ranking" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="ranking" type="number" value="${scoreInstance.ranking}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'scoreType', 'error')} required">
	<label for="scoreType">
		<g:message code="score.scoreType.label" default="Score Type" />
		<span class="required-indicator">*</span>
	</label>
	<g:select name="scoreType" from="${de.dewarim.rock.ScoreType?.values()}" keys="${de.dewarim.rock.ScoreType.values()*.name()}" required="" value="${scoreInstance?.scoreType?.name()}" />

</div>

<div class="fieldcontain ${hasErrors(bean: scoreInstance, field: 'song', 'error')} required">
	<label for="song">
		<g:message code="score.song.label" default="Song" />
		<span class="required-indicator">*</span>
	</label>
	<g:select id="song" name="song.id" from="${de.dewarim.rock.Song.listOrderByName()}" optionValue="${{it.name + ' - ' + it.band.name}}" optionKey="id" required="" value="${scoreInstance?.song?.id}" class="many-to-one"/>

</div>

