class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_quote

  def create
    @like = current_user.likes.build(quote: @quote)

    if @like.save
      respond_to do |format|
        format.html { redirect_to @quote, notice: 'いいねしました！'}
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            "like-button-#{@quote.id}",
            partial: 'likes/like_button',
            locals: { quote: @quote }
          )
        end
      end
    else
      redirect_to @quote, alert: 'いいねできません'
    end
  end

  def destroy
    @like = current_user.likes.find_by(quote: @quote)
    @like.destroy!

    respond_to do |format|
      format.html { redirect_to @quote, notice: 'いいねを取り消しました' }
      format.turbo_stream do
        render turbo_stream: turbo_stream.replace(
          "like-button-#{@quote.id}",
          partial: 'likes/like_button',
          locals: { quote: @quote }
        )
      end
    end
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

end
