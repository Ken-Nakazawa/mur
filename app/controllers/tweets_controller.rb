class TweetsController < ApplicationController
  def search
    client = Twitter::REST::Client.new do |config|
      # 事前準備で取得したキーのセット
      config.consumer_key         = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
      config.consumer_secret      = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
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
