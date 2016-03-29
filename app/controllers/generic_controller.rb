class GenericController < ApplicationController
  private
  def nl2br(s)
    s.gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end
  def error_message(object, message)
    model_error_message = ""
    if object.present? and object.errors.present?
      debugger
      model_error_message = "<br>" + object.errors.messages.values.join("<br>")
    end
    flash[:error] = message + model_error_message
  end
end
