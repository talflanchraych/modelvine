# app/decorators/access_code_decorator.rb
class AccessCodeDecorator < Draper::Decorator
	delegate :code, :used, :used_by
	
	def used_by_user_name
		if object.used_by
			User.find(object.used_by).name
		else
			nil
		end
	end
end