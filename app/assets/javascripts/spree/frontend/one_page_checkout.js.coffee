window.replace_checkout_step = (step, partial, error) ->
  disable_steps true
  step.html(partial) if partial?
  step.find('form.edit_order').prepend("<p class='checkout-error'>#{error}</p>") if !!error
  enable_step step

enable_step = (element) ->
  element.removeClass("disabled-step")
  $(":input", element).attr("disabled", false)
  element.find("#checkout-summary, .errorExplanation").show()
  # Call Spree step specific javascript
  Spree.onAddress() if element.data('step') == 'address'
  Spree.onPayment() if element.data('step') == 'payment'

disable_steps = (all) ->
  elements = if all? then ($ ".checkout_content") else ($ ".checkout_content.disabled-step")
  elements.addClass("disabled-step")
  $(":input", elements).attr("disabled", true)
  elements.find("#checkout-summary, .errorExplanation").hide()

Spree.ready ($) ->
  if ($ '#checkout').is('*')
    disable_steps()
