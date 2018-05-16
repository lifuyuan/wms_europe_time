class SessionsController < ApplicationController

	# 登录
	def create
		# 获取token信息
		if token_info = SessionsHelper.login(params[:email], params[:password])
			# 获取用户信息
			if account_info = SessionsHelper.get_account_info("1")
				flash[:notice] = "登录成功"
				session[:access_token] = token_info["access_token"]
				session[:toeen_expires_in] = token_info["expires_in"]
				session[:account] = account_info["data"]
			else
				flash[:notice] = "获取用户信息失败，请联系客服"
			end
		else
			flash[:notice] = "邮箱或密码不正确"
		end
		redirect_to root_path
	end

	# 注销
	def destroy
		session[:access_token] = nil
		session[:toeen_expires_in] = nil
		session[:account] = nil
		redirect_to root_path
	end

end