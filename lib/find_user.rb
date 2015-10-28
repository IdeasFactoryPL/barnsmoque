module FindUser	
	def user
		@u = User.find_by_id(self.user_id)
		if @u == nil
			@r = Role.where("name = 'admin'").first.id
			@u = User.where("role_id = #{@r}").first
		end
		if @u.name.present? and @u.surname.present?
			[@u.name + " " + @u.surname, @u]
		else
			[@u.email, @u]
		end
	end
end