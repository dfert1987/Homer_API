class ApplicationController < ActionController::API
    
    def authenticate
        auth_header = request.headers[:authorization]

        if !auth_header
            render json: { error: "You must be logged in." }, status: :forbidden
        else
            token = auth_header.split(' ')[1]
            secret = 'Secret shit'
            
            begin
                decoded_token = JWT.decode token, secret

                payload = decoded_token.first
                user_id = payload['user_id']

                @user = User.find user_id

               
            rescue
                render json: { error: 'Invalid token.'}, status: :forbidden
            end
        end 
    end
end
