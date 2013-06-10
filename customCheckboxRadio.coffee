define ['jquery'], ($) ->
	styledInputsSelector = '.checkbox, .radio'
	$('body').on "mousedown", styledInputsSelector, ->
		if ($r = $(@).find(':radio')).length > 0
			$r.click()
			$(@).toggleClass 'on', ($i = $(@).find('input')).attr('checked') is 'checked'
			$("""input[name="#{$i.attr('name')}"]""").each ->
				p = $(@).parent()
				$(p).toggleClass 'on', $(p).find('input').attr('checked') is 'checked'
	$('body').on "click", styledInputsSelector, (e, data) ->
		if $(@).find(':checkbox').length > 0
			$i = $(@).find('input')
			unless $.support.submitBubbles #Instead of $.browser.msie
				if $i.attr('checked') is 'checked'
					$i.attr('checked', null)
				else
					$i.attr('checked', 'checked')
			$(@).toggleClass 'on', $i.is(':checked')
	$ ->
		$(styledInputsSelector).each ->
			$(@).toggleClass 'on', $(@).find('input').attr('checked') is 'checked'