class CardsController < ApplicationController
  before_action :checkUserSignedIn
  before_action :check_card   , only: [:index, :new]

  require "payjp"

  def index
  end

  def new
  end

  def create
    # どこから遷移してきたかを取得
    path = Rails.application.routes.recognize_path(request.referer)
    if path[:controller] == "cards" && path[:action] == "new"
      redirectSuccessUrl = card_path(current_user.id)
      redirectFailureUrl = new_card_path
    else
      redirectSuccessUrl = sign_up_complet_path
      redirectFailureUrl = sign_up_card_add_path(current_user.id)
    end

    Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_ACCESS_KEY]
    if params['payjp-token'].present?
      # TODO: noticeの実装
      customer = Payjp::Customer.create(
      description: current_user.nickname, 
      card: params['payjp-token'],
      )
      card = Card.new(user_id: current_user.id, customer_id: customer.id, card_id: customer.default_card)
      if card.save
        redirect_to redirectSuccessUrl
      else
        redirect_to redirectFailureUrl
      end
    else
      redirect_to redirectFailureUrl
    end
  end

  def show
    @card = Card.where(user_id: current_user.id).first
    # カード情報有無で分岐
    if @card.blank?
      redirect_to action: "index" 
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(@card.customer_id)
      @card_information = customer.cards.retrieve(@card.card_id)

      # カード会社のアイコンを表示するための分岐。---------
      @card_brand = @card_information.brand
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
      @month_year = @card_information.exp_month.to_s + " / " + @card_information.exp_year.to_s[2,3]
    end
  end

  def destroy
    card = current_user.cards.first
    # カード情報有無で分岐
    if card.blank?
    else
      Payjp.api_key = Rails.application.credentials[:payjp][:PAYJP_ACCESS_KEY]
      customer = Payjp::Customer.retrieve(card.customer_id)
      customer.delete
      card.delete
    end
      redirect_to cards_path, notice: "削除が完了しました"
  end

  private

  def check_card
    # データが存在するかどうかでページを遷移するか変わる
    card = Card.where(user_id: current_user.id)
    # 存在している場合はshowアクションへ
    redirect_to card_path(card) if card.present?
  end

end
