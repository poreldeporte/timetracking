class SiteController < ApplicationController
	def home
		render 'home' # name of view template
	end 
	def about
		render 'about'
	end 
	def contact
		render 'contact_layout'
	end
end
