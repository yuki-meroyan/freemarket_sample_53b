class CardsController < ApplicationController
  before_action :check_card, only: [:index, :new]

  require "payjp"

  # TODO: current_user.idは固定
  def index

  end

  def new
    
  end

  def create

    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_ACCESS_KEY]
    binding.pry
    if params['payjp-token'].blank?
      redirect_to action: "new"
    else
      customer = Payjp::Customer.create(
      description: '登録test', 
      # email: current_user.email,
      card: params['payjp-token'],
      # metadata: {user_id: current_user.id}
      metadata: {user_id: 1}
      )
      # @card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      card = Card.new(user_id: 1, customer_id: customer.id, card_id: customer.default_card)
      if card.save
        redirect_to action: "show", user_id: 1, notice: "登録が完了しました"
      else
        redirect_to action: "new", notice: "登録に失敗しました"
      end
    end
  end

  def show
    # card = Card.where(user_id: current_user.id).first
    @card = Card.where(user_id: 1).first
    # カード情報有無で分岐
    if @card.blank?
      redirect_to action: "index" 
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @default_card_information = customer.cards.retrieve(@card.card_id)

      # カード会社のアイコンを表示するための分岐。---------
      @card_brand = @default_card_information.brand
      case @card_brand
      when "Visa"
        @card_src = "visa.svg"
      when "JCB"
        @card_src = "jcb.svg"
      when "MasterCard"
        @card_src = "master-card.svg"
      when "American Express"
        @card_src = "american_express.svg"
      when "Diners Club"
        @card_src = "dinersclub.svg"
      when "Discover"
        @card_src = "discover.svg"
      end
      # ---------------------------------------------------------------
      @month_year = @default_card_information.exp_month.to_s + " / " + @default_card_information.exp_year.to_s[1,2]
    end
  end

  def destroy
    # card = Card.where(user_id: current_user.id).first
    card = Card.where(user_id: 1).first
    # カード情報有無で分岐
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to action: "index", notice: "削除が完了しました"
  end

  private

  def check_card
    # データが存在するかどうかでページを遷移するか変わる
    # card = Card.where(user_id: current_user.id)
    card = Card.where(user_id: 1)
    # # 存在している場合はshowアクションへ
    redirect_to action: "show", id: 1 if card.exists?
  end

end
