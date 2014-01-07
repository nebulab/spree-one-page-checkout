window.replace_checkout_step = (step, partial, error) ->
  disable_steps true
  step.html(partial) if partial?
  step.find('form.edit_order').prepend("<p class='checkout-error'>#{error}</p>") if !!error
  enable_step step

enable_step = (element) ->
  element.removeClass("disabled-step")
  element.find("form input").removeAttr("disabled")
  element.find("#checkout-summary, .errorExplanation").show()
  # Call Spree step specific javascript
  Spree.onAddress() if element.data('step') == 'address'
  Spree.onPayment() if element.data('step') == 'payment'

disable_steps = (all) ->
  elements = if all? then ($ ".checkout_content") else ($ ".checkout_content.disabled-step")
  elements.addClass("disabled-step")
  elements.find("form input").attr("disabled", "disabled")
  elements.find("#checkout-summary, .errorExplanation").hide()

$ ->
  if ($ '#checkout').is('*')
    disable_steps()