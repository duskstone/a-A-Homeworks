class SessionsController < ApplicationController

    def create
        user = User.find_by_credentials(params[:user][:email], params[:user][:password])
        #finding user for this current session
        if user     
            login(user)
            redirect_to users_url #show page showing users emails
        else 
            flash.now[:errors] = ["wrong username/password combination"] #error on user entering wrong info
            render :new #think of logging in wrong and the page sends you to log in again
        end 
    end 

    def new #?
        render :new
    end 

    def destroy
        logout #kills our session and sets any important attritbutes to nil

        redirect_to new_session_url #to new page
    end
end
