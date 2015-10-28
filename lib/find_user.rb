module FindUser	
	def user
		if self.user_id != nil
			@u = User.find(self.user_id)
		end
		if @u.name.present? and @u.surname.present?
			[@u.name + " " + @u.surname, @u]
		else
			[@u.email, @u]
		end
	end
end