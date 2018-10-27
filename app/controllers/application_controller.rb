class ApplicationController < ActionController::Base
    require 'line/bot'

    class ApplicationController < ActionController::Base
        protect_from_forgery with: :null_session

        before_action :validate_signature

        def validate_signature
            body = request.body.read
            signature = request.env['HTTP_X_LINE_SIGNATURE']
            unless client.validate_signature(body, signature)
                error 400 do 'Bad Request' end
            end
        end

        def client
            @client ||= Line::Bot::Client.new { |config|
                config.channel_secret = "d248cfcbd73b17beb51fe5ee9559a945"
                config.channel_token = "e3iGKLXHnqjqxDIpqldm2nES507sPk8er2GXZcXc5VibCVcN/DPLOQnKIn5u6juweijM0PUhRhXsVa2mwM4pjhSNQO5wtdj1h7pTMF9sJQdtArYq4DCK8zHAmybe7Q6+8kFauVaK1qC7ZBiX4f7wkQdB04t89/1O/w1cDnyilFU="
                # ローカルで動かすだけならベタ打ちでもOK
                # config.channel_secret = "your channel secret"
                # config.channel_token = "your channel token"
            }
        end
    end
end
