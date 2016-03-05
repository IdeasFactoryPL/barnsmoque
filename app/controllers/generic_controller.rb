class GenericController < ApplicationController
  private
  def nl2br(s)
    s.gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end
  def error_message(message)
    model_error_message = ""
    if @menu_group.errors.present?
      model_error_message = "<br>" + @menu_group.errors.messages.first[1][0]
    end
    flash[:error] = message + model_error_message
  end
end
