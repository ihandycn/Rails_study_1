class NeiceController < ApplicationController
  def main
        echostr = params[:echostr]
        if echostr.nil?
          render plain: "Not verify request. " + get_access_token
        else
          render plain: echostr
        end
  end
  
  def get_access_token
    if Rails.cache.read("access_token").nil?
      url = "https://api.weixin.qq.com/cgi-bin/token?grant_type=client_credential&appid=wx9e2d464adaebb4d1&secret=5fa78b3424a4b3821abe8fc82a167787"
      res = RestClient.get(URI.escape(url))
      resfs = JSON.parse(res)
      Rails.cache.write("access_token", resfs['access_token'], expires_in: 5.minutes)
      return resfs['access_token']
    else
      Rails.cache.read("access_token")
    end
  end
end
