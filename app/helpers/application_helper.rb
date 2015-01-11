module ApplicationHelper
  def errors_js_view errored
    errored.errors.messages.collect{ |key,value| "<strong>#{key.try(:capitalize)}</strong> #{value[0]}"  }.join("<br/>").html_safe
  end
end
