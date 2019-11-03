require 'rails_helper'

RSpec.describe Item, type: :model do

  before do
    @user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  it "has a valid factory of user" do
    user = @user
    expect(user).to be_valid
  end
# バリデーション
  it "is valid with a :name,:ancestry,:price,:region,:delivery_fee,:shipping_method,:delivery_days,:brand,:category,:user" do
    item = @item
    expect(item).to be_valid
  end

  it "is valid without a description" do
    item = build(:item, description: nil)
    expect(item).to be_valid
  end

  it "is invalid without a name" do
    item = build(:item, name: nil)
    item.valid?
    expect(item.errors[:name]).to include("を入力してください")
  end

  it "is invalid without a ancestry" do
    item = build(:item, ancestry: nil)
    item.valid?
    expect(item.errors[:ancestry]).to include("を入力してください")
  end
  it "is invalid without a price" do
    item = build(:item, price: nil)
    item.valid?
    expect(item.errors[:price]).to include("を入力してください")
  end
  it "is invalid without a region" do
    item = build(:item, region: nil)
    item.valid?
    expect(item.errors[:region]).to include("を入力してください")
  end
  it "is invalid without a delivery_fee" do
    item = build(:item, delivery_fee: nil)
    item.valid?
    expect(item.errors[:delivery_fee]).to include("は一覧にありません")
  end
  it "is invalid without a delivery_days" do
    item = build(:item, delivery_days: nil)
    item.valid?
    expect(item.errors[:delivery_days]).to include("を入力してください")
  end
  it "is invalid without a shipping_method" do
    item = build(:item, shipping_method: nil)
    item.valid?
    expect(item.errors[:shipping_method]).to include("を入力してください")
  end
  it "is invalid without a brand" do
    item = build(:item, brand: nil)
    item.valid?
    expect(item.errors[:brand]).to include("を入力してください")
  end
  it "is invalid without a user" do
    item = build(:item, user: nil)
    item.valid?
    expect(item.errors[:user]).to include("を入力してください")
  end
  it "is invalid without a category" do
    item = build(:item, category: nil)
    item.valid?
    expect(item.errors[:category]).to include("を入力してください")
  end


# 文字数制限
  it "is invalid with name more than 40 words" do
    item = build(:item, name: "a"* 41,)
    item.valid?
    expect(item.errors[:name]).to include("は40文字以内で入力してください")
  end
  it "is invalid with description more than 1000 words" do
    item = build(:item, description: "a" * 1001,)
    item.valid?
    expect(item.errors[:description]).to include("は1000文字以内で入力してください")
  end
# カラム形の制限
  it "is invalid without a price int" do
    item = build(:item,price: "ああああ")
    item.valid?
    expect(item.errors[:price]).to include("は数値で入力してください")
  end
# 値段が300円から9,999,999円の間
  it "is invalid for prices below 300 yen " do
    item = build(:item,price: "299")
    item.valid?
    expect(item.errors[:price]).to include("は300以上の値にしてください")
  end
  it "is invalid with price more than 9999999 YEN" do
    item = build(:item,price: "10000000")
    item.valid?
    expect(item.errors[:price]).to include("は9999999以下の値にしてください")
  end

end
