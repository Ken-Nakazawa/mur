class TweetsController < ApplicationController
  def search
      client = Twitter::REST::Client.new do |config|
        # 事前準備で取得したキーのセット
        config.consumer_key         = "9ANwqVTcD0vBHxhifWw3liUGB"
        config.consumer_secret      = "pSfA7G3bAQlMBHoX0jZsY52KYaN095pajo33y50BhksMKwIjoJ"
      end

      @tweets1 = client.trends(1118370)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @tweets1 } # jsonを指定した場合、jsonフォーマットで返す
      end
    end
  end
