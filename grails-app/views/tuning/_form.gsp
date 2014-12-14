<%@ page import="de.dewarim.rock.Tuning" %>



<div class="fieldcontain ${hasErrors(bean: tuningInstance, field: 'name', 'error')} required">
	<label for="name">
		<g:message code="tuning.name.label" default="Name" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="name" required="" value="${tuningInstance?.name}"/>

</div>

