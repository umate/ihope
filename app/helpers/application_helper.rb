module ApplicationHelper
  def input_error(object, attribute)
    if (errors = object.errors[attribute])
      content_tag 'div', errors.join('<br>'), class: 'error'
    end
  end

  def format_date(date, format = t('date.formats.default'))
    I18n.l date, format: format
  end
end
