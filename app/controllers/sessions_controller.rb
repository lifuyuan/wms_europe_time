class SessionsController < ApplicationController

	def create
		if json_res = SessionsHelper.login(params[:email], params[:password])
			flash[:notice] = "登录成功"
			session[:access_token] = json_res["access_token"]
			session[:toeen_expires_in] = json_res["expires_in"]
		else
			flash[:notice] = "邮箱或密码不正确"
		end
		redirect_to root_path
	end

end