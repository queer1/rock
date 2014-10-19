<%@ page import="de.dewarim.rock.Band" %>



<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="band.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${bandInstance?.name}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'songs', 'error')} ">
	<label for="songs">
		<g:message code="band.songs.label" default="Songs" />
		
	</label>
	
<ul class="one-to-many">
<g:each in="${bandInstance?.songs?}" var="s">
    <li><g:link controller="song" action="show" id="${s.id}">${s?.encodeAsHTML()}</g:link></li>
</g:each>
<li class="add">
<g:link controller="song" action="create" params="['band.id': bandInstance?.id]">${message(code: 'default.add.label', args: [message(code: 'song.label', default: 'Song')])}</g:link>
</li>
</ul>


</div>

