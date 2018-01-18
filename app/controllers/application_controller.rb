class ApplicationController < ActionController::API
  before_action :authorized
 # this will run before every single action gets called, make sure you skip_before_action in the appropriate places

 def issue_token(payload)
   # JWT.encode(payload, ENV['secret'], 'HS256')
   JWT.encode(payload, 'somesecretkey', 'HS256')
   # your secret should be in another file that is .gitignore'd, use a gem like 'figaro' to manage
 end

 def current_user
   @user ||= User.find_by(username: user_id)
 end

 def user_id
   decoded_token.first['id']
 end

 def decoded_token
   begin
      JWT.decode(request.headers['Authorization'], 'somesecretkey', true, { :algorithm => 'HS256' })
    rescue JWT::DecodeError
     [{}]
    end
 end

 def authorized
   render json: {message: "Not welcome" }, status: 401 unless logged_in?
 end

 def logged_in?
   !!current_user
 end
end
