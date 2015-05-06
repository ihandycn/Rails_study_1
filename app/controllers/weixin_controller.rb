class WeixinController < ApplicationController
    def weixin
        echostr = params[:echostr]
        render plain: echostr
    end
    
    def index
        render plain: 'OK'
    end
end
