class RakutenController < ApplicationController
  def search
    if params[:keyword]
      @items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword])
      end

      client = Twitter::REST::Client.new do |config|
        # 事前準備で取得したキーのセット
        config.consumer_key         = ""
        config.consumer_secret      = ""
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
        @tweets1 = client.trends(1118370)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @tweets } # jsonを指定した場合、jsonフォーマットで返す
        format.json { render json: @tweets1 } # jsonを指定した場合、jsonフォーマットで返す
      end
    end
  end
