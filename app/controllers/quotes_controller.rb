class QuotesController < ApplicationController
  before_action :authenticate_user!, only: %i[new create edit update destroy]
  before_action :set_quote, only: %i[show edit update destroy]

  def index
    @quotes = Quote.includes(:user).order(created_at: :desc)
  end

  def new
    @quote = Quote.new
  end

  def create
  
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end


end
