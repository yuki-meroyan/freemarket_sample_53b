# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# coding: utf-8

User.create!(
  [
    {
      email: '1@1',
      password: '111111',
      nickname: 'tanaka',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      email: '2@2',
      password: '222222',
      nickname: 'suzuki',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    }
  ]
)
Brand.create!(
  [
    {
      name: 'adidas',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'nike',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
  ]
)

parent_array = ['レディース','メンズ','ベビー・キッズ','インテリア・住まい・小物','本・音楽・ゲーム','おもちゃ・ホビー・グッズ','コスメ・香水・美容','家電・スマホ・カメラ','スポーツ・レジャー','ハンドメイド','チケット','自動車・オートバイ','その他']
parent_array.each do |parent|
  parnetCategory = Category.create(category: parent)
end

parent_child_array = ['レディース','トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他','メンズ','トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他','ベビー・キッズ','ベビー服(女の子用) ~95cm','ベビー服(男の子用) ~95cm','ベビー服(男女兼用) ~95cm','キッズ服(女の子用) 100cm~','キッズ服(男の子用) 100cm~','キッズ服(男女兼用) 100cm~','キッズ靴','子ども用ファッション小物','おむつ/トイレ/バス','外出/移動用品','授乳/食事','ベビー家具/寝具/室内用品','おもちゃ','行事/記念品','その他','インテリア・住まい・小物','キッチン/食器','ベッド/マットレス','ソファ/ソファベッド','椅子/チェア','机/テーブル','収納家具','ラグ/カーペット/マット','カーテン/ブラインド','ライト/照明','寝具','インテリア小物','季節/年中行事','その他','本・音楽・ゲーム','本','漫画','雑誌','CD','DVD/ブルーレイ','レコード','テレビゲーム','おもちゃ・ホビー・グッズ','おもちゃ','タレントグッズ','コミック/アニメグッズ','トレーディングカード','フィギュア','楽器/器材','コレクション','ミリタリー','美術品','アート用品','その他','コスメ・香水・美容','ベースメイク','メイクアップ','ネイルケア','香水','スキンケア/基礎化粧品','ヘアケア','ボディケア','オーラルケア','リラクゼーション','ダイエット','その他','家電・スマホ・カメラ','スマートフォン/携帯電話','スマホアクセサリー','PC/タブレット','カメラ','テレビ/映像機器','オーディオ機器','美容/健康','冷暖房/空調','生活家電','その他','スポーツ・レジャー','ゴルフ','フィッシング','自転車','トレーニング/エクササイズ','野球','サッカー/フットサル','テニス','スノーボード','スキー','その他スポーツ','アウトドア','その他','ハンドメイド','アクセサリー(女性用)','ファッション/小物','アクセサリー/時計','日用品/インテリア','趣味/おもちゃ','キッズ/ベビー','素材/材料','二次創作物','その他','チケット','音楽','スポーツ','演劇/芸能','イベント','映画','施設利用券','優待券/割引券','その他','自動車・オートバイ','自動車本体','自動車タイヤ/ホイール','自動車パーツ','自動車アクセサリー','オートバイ車体','オートバイパーツ','オートバイアクセサリー','その他','まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']

parent_id_cnt = 0

parent_child_array.each do |parent_child|
  if parent_child == parent_array[parent_id_cnt]
    parent_id_cnt += 1
  else
    parnetCategory = Category.where(category: parent_array[parent_id_cnt-1]).first_or_initialize
    childCategory = parnetCategory.children.create(category: parent_child)
  end
end

grandchildCategory  = Category.create!(category: 'Tシャツ(半袖、袖なし)',ancestry: '14')
grandchildCategory2  = Category.create!(category: 'Tシャツ(長袖、7部丈)',ancestry: '14')


Item.create!(
  [
    {
      name: 'adidasのスーパ-スター',
      description: '新品未使用です',
      ancestry:'2',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スターレインボー',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'苫小牧',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スター黒',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スター黄色',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スター緑',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スター赤',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スター青',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパ-スター茶色',
      description: '新品未使用です',
      ancestry:'1',
      price: '20',
      region:'セルビア・モンテネグロ',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'muneo',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'札幌',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'1',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'sonoko',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'白崎',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'papaiya',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'沖縄',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'udo',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'山形',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'sarina',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'堺',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'sawa',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'新橋',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'nana',
      description: 'a',
      ancestry:'1',
      price: '20',
      region:'茨城',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
  ]
)


ItemImage.create!(
  [
    {
      image: open("#{Rails.root}/app/assets/images/seed/img1.jpg"),
      item_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img2.jpg"),
      item_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img1.jpg"),
      item_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img3.jpg"),
      item_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img4.jpg"),
      item_id:'1',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img5.webp"),
      item_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img6.webp"),
      item_id:'3',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img7.webp"),
      item_id:'4',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image:open("#{Rails.root}/app/assets/images/seed/img8.webp"),
      item_id:'5',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img9.webp"),
      item_id:'6',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img10.webp"),
      item_id:'7',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img11.jpg"),
      item_id:'8',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img12.jpg"),
      item_id:'9',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img13.jpg"),
      item_id:'10',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img14.jpg"),
      item_id:'11',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img15.jpg"),
      item_id:'12',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img16.jpg"),
      item_id:'13',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img17.jpg"),
      item_id:'14',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img18.jpeg"),
      item_id:'15',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },

  ]
)