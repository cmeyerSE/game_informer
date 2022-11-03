class SessionsController < ApplicationController

    def create
        if auth
            user = User.find_or_create_by(email: auth['info']['email']) do
                u.password = SecureRandom.hex(12)
            end
            if user 
                redirect_to reviews_path
            else
                redirect_to root_path
            end
        else
            user = User.find_by(username: params[:username])
            if user.present? && user.authenticate(params[:password])
                session[:user_id] = user.id 
                redirect_to root_path, notice: "Logged in successfully"
            else
                flash[:alert] = "Invalid username or password"
                render :new
            end
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: "Logged Out!"
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end