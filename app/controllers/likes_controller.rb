class LikesController < ApplicationController

  before_action :authenticate_user!
  before_action :set_quote

  def create
    @like = current_user.likes.build(quote: @quote)
    @like.save
  end

  def destroy
    @like = current_user.likes.find_by(quote: @quote)
    @like.destroy!
  end

  private

  def set_quote
    @quote = Quote.find(params[:quote_id])
  end

end
