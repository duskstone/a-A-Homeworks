class UsersController < ApplicationController
    #pt2: write methods on UsersController to allow new users to sign up
    #wtf are those methods 

    def create 
        @user = User.new(user_params) 

        if @user.save 
            login(@user) #login method, helper method written in application_controller
            redirect_to users_url(@user) #why?
        else 
          flash.now[:errors] = @user.errors.full_messages #errors rendered when user creation fails
        end
    end

    def new #starts up a new instance of User. #Instantiate an empty object. Render the new form.
      @user = User.new
      render :new       #Any other controller value. Use an instance when rendering
    end 

    def show 
        @user = User.find_by(params[:id])
        render :show
    end

    def user_params #whitelisting the appropiate attributes to create a new user
        params.require(:user).permit(:email, :password)
    end
end
