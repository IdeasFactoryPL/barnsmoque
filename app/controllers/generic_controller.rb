class GenericController < ApplicationController
  private
  def nl2br(s)
    s.gsub(/(?:\n\r?|\r\n?)/, '<br>')
  end
end
