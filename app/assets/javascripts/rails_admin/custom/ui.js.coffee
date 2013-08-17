$ ->
  bind_locale_selector()
  $('body').bind 'pjax:end', bind_locale_selector

  $('form input, form textarea').change ->
    window.input_data_changed = true

bind_locale_selector = ->
  window.input_data_changed = false
  confirm_text = 'Вы уверены что хотите сменить локаль редактирования? Текущие данные не будут сохранены.'

  locale_changer = $('#locales_changer')
  current_locale = locale_changer.val()

  locale_changer.change ->
    change_allowed = !window.input_data_changed || (window.input_data_changed && confirm(confirm_text))

    if change_allowed
      locale = $(this).val()
      locale_regexp = /\?locale=\w{2}/
      if locale_regexp.test(document.URL)
        location = document.URL.replace(locale_regexp, '?locale=' + locale)
      else
        location = document.URL + '?locale=' + locale

      window.location = location
    else
      locale_changer.val(current_locale)
