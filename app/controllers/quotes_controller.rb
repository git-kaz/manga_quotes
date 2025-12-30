class QuotesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_quote, only: %i[show edit update destroy]
  before_action :authorize_user!, only: %i[edit update destroy]
  before_action :set_search

  def index
    @quotes = @q.result(distinct: true).includes(:user).order(created_at: :desc)
  end

  def new
    @quote = Quote.new
  end

  def create
    @quote = current_user.quotes.build(quote_params)
    if @quote.save
      redirect_to @quote, notice: 'セリフを作成しました'
    else
      render :new, status: :unprocessable_entity
    end
  
  end

  def show
  end

  def edit
  end

  def update
    if @quote.update(quote_params)
      redirect_to quote_path(@quote), notice: 'セリフを更新しました'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @quote.destroy
    redirect_to quotes_path, notice: 'セリフを削除しました', status: see_other
  end

  private

  def set_quote
    @quote = Quote.find(params[:id])
  end

  def quote_params
    params.require(:quote).permit(:content, :source, :scene)
  end

  def set_search
    @q = Quote.ransack(params[:q])
  end

  def authorize_user!
    unless current_user.own?(@quote)
      redirect_to quotes_path, alert: '権限がありません'
    end
  end


end
