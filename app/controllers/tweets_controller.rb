class TweetsController < ApplicationController

attr_reader = :client

def initialize()
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key        = "9ANwqVTcD0vBHxhifWw3liUGB"
      config.consumer_secret     = "pSfA7G3bAQlMBHoX0jZsY52KYaN095pajo33y50BhksMKwIjoJ"
      config.access_token        = "990061625024569344-rMlDq4teFHtw1Snh6txDQgZtSLIbvvg"
      config.access_token_secret = "QEh92Vc2mGq82nLkVnOL8pMxJ2Wr0aofj8Itns0R920To"
    end
  end

  def twieet(str)
    @client.update(str)
  end


  def search
    client = Twitter::REST::Client.new do |config|
      # 事前準備で取得したキーのセット
      config.consumer_key         = "9ANwqVTcD0vBHxhifWw3liUGB"
      config.consumer_secret      = "pSfA7G3bAQlMBHoX0jZsY52KYaN095pajo33y50BhksMKwIjoJ"
    end
    @tweets = []
    since_id = nil
    # 検索ワードが存在していたらツイートを取得
    if params[:keyword].present?
      # リツイートを除く、検索ワードにひっかかった最新20件のツイートを取得する
      tweets = client.search(params[:keyword], count: 20, result_type: "recent", exclude: "retweets", since_id: since_id)
      # 取得したツイートをモデルに渡す
      tweets.take(20).each do |tw|
        tweet = Tweet.new(tw.full_text)
        @tweets << tweet
      end
    end
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweets } # jsonを指定した場合、jsonフォーマットで返す
    end
  end



end
