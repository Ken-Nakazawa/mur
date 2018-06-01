class PagesController < ApplicationController
  def index
    client = Twitter::REST::Client.new do |config|
      # 事前準備で取得したキーのセット
      config.consumer_key         = "9ANwqVTcD0vBHxhifWw3liUGB"
      config.consumer_secret      = "pSfA7G3bAQlMBHoX0jZsY52KYaN095pajo33y50BhksMKwIjoJ"
    end
    @trends = client.trends(1118370)
    @trends.each do |trend|
      t = trend.name.dup
      puts t.gsub!(/(#)/, '')
      #puts t
    end
    @trends.each do |trend|
      t = trend.name
      puts t.delete("#")
    end

    @tweets = []
    since_id = nil

    # 検索ワードが存在していたらツイートを取得
    if params[:keyword].present?
      # リツイートを除く、検索ワードにひっかかった最新30件のツイートを取得する
      tweets = client.search(params[:keyword], count: 30, result_type: "recent", exclude: "retweets", since_id: since_id)
      # 取得したツイートをモデルに渡す
      tweets.take(30).each do |tw|
        tweet = Tweet.new(tw.full_text)
        @tweets << tweet
      end
    end
      @trends = client.trends(1118370)
    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @tweets } # jsonを指定した場合、jsonフォーマットで返す
      format.json { render json: @trends } # jsonを指定した場合、jsonフォーマットで返す
    end
  end
end
