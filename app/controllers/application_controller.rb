class ApplicationController < ActionController::API

    def autherize_request
        header=request.headers['Authorization']
        token = header.split(' ').last if header
        decoded = JwtService.decode(token)

        @current_driver = Driver.find(decoded[:driver_id]) if decoded

        rescue ActiveRecord::RecordNotFound, JWT::DecodeError
            render json: { errors: 'Unauthorized' }, status: :unauthorized
        end

    end
end
