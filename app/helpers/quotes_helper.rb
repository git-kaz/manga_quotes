module QuotesHelper
  #xシェア機能
  def x_share_text(quote)
    "#{quote.content}/n/n出典: #{quote.source}"
  end

  def x_share_url(quote)
    params = {
      url: quote_url(quote),
      text: x_share_text(quote),
      hashtags: 'プレゼンテーションに一言を,RUNTEQ'
    }
  end
end
