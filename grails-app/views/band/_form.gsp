<%@ page import="de.dewarim.rock.Band" %>



<div class="fieldcontain ${hasErrors(bean: bandInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="band.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${bandInstance?.name}"/>

</div>

</div>

