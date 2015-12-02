class Voucher < ActiveRecord::Base
  acts_as_paranoid
	include FindUser
	validates_length_of :code, minimum: 8, maximium: 8, allow_blank: false
  before_save { |voucher| voucher.code = voucher.code.downcase }
end
