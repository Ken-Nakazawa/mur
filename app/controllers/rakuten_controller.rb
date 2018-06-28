class RakutenController < ApplicationController
  def search
    @keyword = params[:keyword]
    @keyword_parse = ""
    nm = Natto::MeCab.new('-d /usr/local/lib/mecab/dic/mecab-ipadic-neologd')
    nm.parse(params[:keyword].delete("#")) do |n|
      if n.feature.include?("名詞")
        @keyword_parse += "#{n.surface} "
      end
    end
    puts @keyword_parse
    if params[:keyword]  != ""
      @items = RakutenWebService::Ichiba::Item.search(keyword: @keyword_parse, affiliateId: "16a1078a.5776ab5e.16a1078b.4f3c0e15", orFlag: 1)

      client = Twitter::REST::Client.new do |config|
        # 事前準備で取得したキーのセット
        config.consumer_key         = "9ANwqVTcD0vBHxhifWw3liUGB"
        config.consumer_secret      = "pSfA7G3bAQlMBHoX0jZsY52KYaN095pajo33y50BhksMKwIjoJ"
      end

      @tweets = []

      since_id = nil
      # 検索ワードが存在していたらツイートを取得
      if params[:keyword].present?
        # リツイートを除く、検索ワードにひっかかった最新30件のツイートを取得する
        tweets = client.search(params[:keyword], count: 30, result_type: "recent", exclude: "retweets", since_id: since_id)
        # 取得したツイートをモデルに渡す

        # tweetを画像付きで表示
        @t_image = []
          i = 0
          tweets.take(30).each do |tw|
            tweet = Tweet.new(tw.full_text)
            @tweets << tweet
            @t_image_i = nil
            tw.media.each do |t|
              @t_image_i = t.media_url
            end
            @t_image[i] =  @t_image_i
            i += 1
          end
      end
        @trends = client.trends(23424977)
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @tweets } # jsonを指定した場合、jsonフォーマットで返す
        format.json { render json: @trends } # jsonを指定した場合、jsonフォーマットで返す
      end
    end
  end
end
