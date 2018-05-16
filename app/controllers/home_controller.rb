class HomeController < ApplicationController

	def index
		redirect_to welcome_path and return if session[:access_token].present? && session[:account].present?

		render layout:false
	end


end