class SessionsController < ApplicationController
    def new
        render "new.html.erb"
    end

    def create
        user = User.find_by(email: params[:email])
        if user && user.authenticate(params[:password])
            session[:user_id] = user.id 
            redirect_to "/contacts"
        else
            redirect_to "/login"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to "/login"
        flash[:success] = "successfully logged out"
    end
end
