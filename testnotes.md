 post '/signup' do
        user = User.new(params)
        if user.username.blank? || user.email.blank? || user.password.blank? || user.first_name.blank? || user.last_name.blank? || User.find_by_email(params[:email]) || User.find_by_username(params[:username])
            flash[:signup_error] = "Invalid sign up, try again. Please fill out all the fields."
            redirect '/signup'
        else 
            user.save
            user.id = session[:user_id]
            redirect '/coffees'
        end
    end
    