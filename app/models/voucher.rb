class Voucher < ActiveRecord::Base
	include FindUser
	validates_length_of :code, minimum: 8, maximium: 8, allow_blank: false
end
