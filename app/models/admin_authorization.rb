class AdminAuthorization < ActiveAdmin::AuthorizationAdapter

#see Active Admin documentation
	def authorized?(action, subject = nil)
		user && user.admin?
	end

end