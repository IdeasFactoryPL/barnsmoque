module FindUser	
	def user
		if self.user_id != nil
			@u = User.find(self.user_id)
		else
			@r = Role.where("name = 'admin'").first.id
			@u = User.where("role_id = #{@r}").first
		end
		if @u.name and @u.surname
			[@u.name + " " + @u.surname, @u]
		else
			[@u.email, @u]
		end
	end
end