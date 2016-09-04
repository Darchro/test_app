class Article < ActiveRecord::Base
	acts_as_taggable

	belongs_to :user

	has_many :comments

	def match_current_user? current_user
		return false unless current_user
		user == current_user
	end
end