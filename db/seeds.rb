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

# ★レディース
lady_child = ['トップス','ジャケット/アウター','パンツ','スカート','ワンピース','靴','ルームウェア/パジャマ','レッグウェア','帽子','バッグ','アクセサリー','ヘアアクセサリー','小物','時計','ウィッグ/エクステ','浴衣/水着','スーツ/フォーマル/ドレス','マタニティ','その他']

lady_grandchild = []
lady_grandchild << ['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ/ブラウス(半袖/袖なし)','シャツ/ブラウス(七分/長袖)','ポロシャツ','キャミソール','タンクトップ','ホルターネック','ニット/セーター','チュニック','カーディガン/ボレロ','アンサンブル','ベスト/ジレ','パーカー','トレーナー/スウェット','ベアトップ/チューブトップ','ジャージ','その他']
lady_grandchild << ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ダウンベスト','ジャンパー/ブルゾン','ポンチョ','ロングコート','トレンチコート','ダッフルコート','ピーコート','チェスターコート','モッズコート','スタジャン','毛皮/ファーコート','スプリングコート','スカジャン','その他']
lady_grandchild << ['デニム/ジーンズ','ショートパンツ','カジュアルパンツ','ハーフパンツ','チノパン','ワークパンツ/カーゴパンツ','クロップドパンツ','サロペット/オーバーオール','オールインワン','サルエルパンツ','ガウチョパンツ','その他']
lady_grandchild << ['ミニスカート','ひざ丈スカート','ロングスカート','キュロット','その他']
lady_grandchild << ['ミニワンピース','ひざ丈ワンピース','ロングワンピース','その他']
lady_grandchild << ['ハイヒール/パンプス','ブーツ','サンダル','スニーカー','ミュール','モカシン','ローファー/革靴','フラットシューズ/バレエシューズ','長靴/レインシューズ','その他']
lady_grandchild << ['パジャマ','ルームウェア','その他']
lady_grandchild << ['ソックス','スパッツ/レギンス','ストッキング/タイツ','レッグウォーマー','その他']
lady_grandchild << ['ニットキャップ/ビーニー','ハット','ハンチング/ベレー帽','キャップ','キャスケット','麦わら帽子','その他']
lady_grandchild << ['ハンドバッグ','トートバッグ','エコバッグ','リュック/バックパック','ボストンバッグ','スポーツバッグ','ショルダーバッグ','クラッチバッグ','ポーチ/バニティ','ボディバッグ/ウェストバッグ','マザーズバッグ','メッセンジャーバッグ','ビジネスバッグ','旅行用バッグ/キャリーバッグ','ショップ袋','和装用バッグ','かごバッグ','その他']
lady_grandchild << ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','イヤリング','アンクレット','ブローチ/コサージュ','チャーム','その他']
lady_grandchild << ['ヘアゴム/シュシュ','ヘアバンド/カチューシャ','ヘアピン','その他']
lady_grandchild << ['長財布','折り財布','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','手袋/アームカバー','ハンカチ','ベルト','マフラー/ショール','ストール/スヌード','バンダナ/スカーフ','ネックウォーマー','サスペンダー','サングラス/メガネ','モバイルケース/カバー','手帳','イヤマフラー','傘','レインコート/ポンチョ','ミラー','タバコグッズ','その他']
lady_grandchild << ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他']
lady_grandchild << ['前髪ウィッグ','ロングストレート','ロングカール','ショートストレート','ショートカール','その他']
lady_grandchild << ['浴衣','着物','振袖','長襦袢/半襦袢','水着セパレート','水着ワンピース','水着スポーツ用','その他']
lady_grandchild << ['スカートスーツ上下','パンツスーツ上下','ドレス','パーティーバッグ','シューズ','ウェディング','その他']
lady_grandchild << ['トップス','アウター','インナー','ワンピース','パンツ/スパッツ','スカート','パジャマ','授乳服','その他']
lady_grandchild << ['コスプレ','下着','その他']

parent_id_cnt = 0

lady_child.each do |child|
  child = Category.create(category: child, ancestry: 1)
  lady_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★メンズ
gentleman_child = ['トップス','ジャケット/アウター','パンツ','靴','バッグ','スーツ','帽子','アクセサリー','小物','時計','水着','レッグウェア','アンダーウェア','その他']

gentleman_grandchild = []
gentleman_grandchild << ['Tシャツ/カットソー(半袖/袖なし)','Tシャツ/カットソー(七分/長袖)','シャツ','ポロシャツ','タンクトップ','ニット/セーター','パーカー','カーディガン','スウェット','ジャージ','ベスト','その他']
gentleman_grandchild << ['テーラードジャケット','ノーカラージャケット','Gジャン/デニムジャケット','レザージャケット','ダウンジャケット','ライダースジャケット','ミリタリージャケット','ナイロンジャケット','フライトジャケット','ダッフルコート','ピーコート','ステンカラーコート','トレンチコート','モッズコート','チェスターコート','スタジャン','スカジャン','ブルゾン','マウンテンパーカー','ダウンベスト','ポンチョ','カバーオール','その他']
gentleman_grandchild << ['デニム/ジーンズ','ワークパンツ/カーゴパンツ','スラックス','チノパン','ショートパンツ','ペインターパンツ','サルエルパンツ','オーバーオール','その他']
gentleman_grandchild << ['スニーカー','サンダル','ブーツ','モカシン','ドレス/ビジネス','長靴/レインシューズ','デッキシューズ','その他']
gentleman_grandchild << ['ショルダーバッグ','トートバッグ','ボストンバッグ','リュック/バックパック','ウエストポーチ','ボディーバッグ','ドラムバッグ','ビジネスバッグ','トラベルバッグ','メッセンジャーバッグ','エコバッグ','その他']
gentleman_grandchild << ['スーツジャケット','スーツベスト','スラックス','セットアップ','その他']
gentleman_grandchild << ['キャップ','ハット','ニットキャップ/ビーニー','ハンチング/ベレー帽','キャスケット','サンバイザー','その他']
gentleman_grandchild << ['ネックレス','ブレスレット','バングル/リストバンド','リング','ピアス(片耳用)','ピアス(両耳用)','アンクレット','その他']
gentleman_grandchild << ['長財布','折り財布','マネークリップ','コインケース/小銭入れ','名刺入れ/定期入れ','キーケース','キーホルダー','ネクタイ','手袋','ハンカチ','ベルト','マフラー','ストール','バンダナ','ネックウォーマー','サスペンダー','ウォレットチェーン','サングラス/メガネ','モバイルケース/カバー','手帳','ストラップ','ネクタイピン','カフリンクス','イヤマフラー','傘','レインコート','ミラー','タバコグッズ','その他']
gentleman_grandchild << ['腕時計(アナログ)','腕時計(デジタル)','ラバーベルト','レザーベルト','金属ベルト','その他']
gentleman_grandchild << ['一般水着','スポーツ用','アクセサリー','その他']
gentleman_grandchild << ['ソックス','レギンス/スパッツ','レッグウォーマー','その他']
gentleman_grandchild << ['トランクス','ボクサーパンツ','その他']
gentleman_grandchild << ['その他']

parent_id_cnt = 0
gentleman_child.each do |child|
  child = Category.create(category: child, ancestry: 2)
  gentleman_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★ベビー・キッズ
babykids_child = ['ベビー服(女の子用) ~95cm','ベビー服(男の子用) ~95cm','ベビー服(男女兼用) ~95cm','キッズ服(女の子用) 100cm~','キッズ服(男の子用) 100cm~','キッズ服(男女兼用) 100cm~','キッズ靴','子ども用ファッション小物','おむつ/トイレ/バス','外出/移動用品','授乳/食事','ベビー家具/寝具/室内用品','おもちゃ','行事/記念品','その他']

babykids_grandchild = []
babykids_grandchild << ['トップス','アウター','パンツ','スカート','ワンピース','ベビードレス','おくるみ','下着/肌着','パジャマ','ロンパース','その他']
babykids_grandchild << ['トップス','アウター','パンツ','おくるみ','下着/肌着','パジャマ','ロンパース','その他']
babykids_grandchild << ['トップス','アウター','パンツ','おくるみ','下着/肌着','パジャマ','ロンパース','その他']
babykids_grandchild << ['コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)','トップス(チュニック)','トップス(タンクトップ)','トップス(その他)','スカート','パンツ','ワンピース','セットアップ','パジャマ','フォーマル/ドレス','和服','浴衣','甚平','水着','その他']
babykids_grandchild << ['コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)','トップス(その他)','パンツ','セットアップ','パジャマ','フォーマル/ドレス','和服','浴衣','甚平','水着','その他']
babykids_grandchild << ['コート','ジャケット/上着','トップス(Tシャツ/カットソー)','トップス(トレーナー)','トップス(その他)','ボトムス','パジャマ','その他']
babykids_grandchild << ['スニーカー','サンダル','ブーツ','長靴','その他']
babykids_grandchild << ['靴下/スパッツ','帽子','エプロン','サスペンダー','タイツ','ハンカチ','バンダナ','ベルト','マフラー','傘','手袋','スタイ','バッグ','その他']
babykids_grandchild << ['おむつ用品','おまる/補助便座','トレーニングパンツ','ベビーバス','お風呂用品','その他']
babykids_grandchild << ['ベビーカー','抱っこひも/スリング','チャイルドシート','その他']
babykids_grandchild << ['ミルク','ベビーフード','ベビー用食器','その他']
babykids_grandchild << ['ベッド','布団/毛布','イス','たんす','その他']
babykids_grandchild << ['おふろのおもちゃ','がらがら','オルゴール','ベビージム','手押し車/カタカタ','知育玩具','その他']
babykids_grandchild << ['お宮参り用品','お食い初め用品','アルバム','手形/足形','その他']
babykids_grandchild << ['母子手帳用品','その他']

parent_id_cnt = 0
babykids_child.each do |child|
  child = Category.create(category: child, ancestry: 3)
  babykids_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★インテリア・住まい・小物
interior_child = ['キッチン/食器','ベッド/マットレス','ソファ/ソファベッド','椅子/チェア','机/テーブル','収納家具','ラグ/カーペット/マット','カーテン/ブラインド','ライト/照明','寝具','インテリア小物','季節/年中行事','その他']

interior_grandchild = []
interior_grandchild << ['食器','調理器具','収納/キッチン雑貨','弁当用品','カトラリー(スプーン等)','テーブル用品','容器','エプロン','アルコールグッズ','浄水機','その他']
interior_grandchild << ['セミシングルベッド','シングルベッド','セミダブルベッド','ダブルベッド','ワイドダブルベッド','クイーンベッド','キングベッド','脚付きマットレスベッド','マットレス','すのこベッド','ロフトベッド/システムベッド','簡易ベッド/折りたたみベッド','収納付き','その他']
interior_grandchild << ['ソファセット','シングルソファ','ラブソファ','トリプルソファ','オットマン','コーナーソファ','ビーズソファ/クッションソファ','ローソファ/フロアソファ','ソファベッド','応接セット','ソファカバー','リクライニングソファ','その他']
interior_grandchild << ['一般','スツール','ダイニングチェア','ハイバックチェア','ロッキングチェア','座椅子','折り畳みイス','デスクチェア','その他']
interior_grandchild << ['こたつ','カウンターテーブル','サイドテーブル','センターテーブル','ダイニングテーブル','座卓/ちゃぶ台','アウトドア用','パソコン用','事務机/学習机','その他']
interior_grandchild << ['リビング収納','キッチン収納','玄関/屋外収納','バス/トイレ収納','本収納','本/CD/DVD収納','洋服タンス/押入れ収納','電話台/ファックス台','ドレッサー/鏡台','棚/ラック','ケース/ボックス','その他']
interior_grandchild << ['ラグ','カーペット','ホットカーペット','玄関/キッチンマット','トイレ/バスマット','その他']
interior_grandchild << ['カーテン','ブラインド','ロールスクリーン','のれん','その他']
interior_grandchild << ['蛍光灯/電球','天井照明','フロアスタンド','その他']
interior_grandchild << ['布団/毛布','枕','シーツ/カバー','その他']
interior_grandchild << ['ごみ箱','ウェルカムボード','オルゴール','クッション','クッションカバー','スリッパラック','ティッシュボックス','バスケット/かご','フォトフレーム','マガジンラック','モビール','花瓶','灰皿','傘立て','小物入れ','置時計','掛時計/柱時計','鏡(立て掛け式)','鏡(壁掛け式)','置物','風鈴','植物/観葉植物','その他']
interior_grandchild << ['正月','成人式','バレンタインデー','ひな祭り','子どもの日','母の日','父の日','サマーギフト/お中元','夏/夏休み','ハロウィン','敬老の日','七五三','お歳暮','クリスマス','冬一般','その他']
interior_grandchild << ['その他']

parent_id_cnt = 0
interior_child.each do |child|
  child = Category.create(category: child, ancestry: 4)
  interior_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★本・音楽・ゲーム / 本(book)・音楽(music)・ゲーム(game)
bmg_child = ['本','漫画','雑誌','CD','DVD/ブルーレイ','レコード','テレビゲーム']

bmg_grandchild = []
bmg_grandchild << ['文学/小説','人文/社会','ノンフィクション/教養','地図/旅行ガイド','ビジネス/経済','健康/医学','コンピュータ/IT','趣味/スポーツ/実用','住まい/暮らし/子育て','アート/エンタメ','洋書','絵本','参考書','その他']
bmg_grandchild << ['全巻セット','少年漫画','少女漫画','青年漫画','女性漫画','同人誌','その他']
bmg_grandchild << ['アート/エンタメ/ホビー','ファッション','ニュース/総合','趣味/スポーツ','その他']
bmg_grandchild << ['邦楽','洋楽','アニメ','クラシック','K-POP/アジア','キッズ/ファミリー','その他']
bmg_grandchild << ['外国映画','日本映画','アニメ','TVドラマ','ミュージック','お笑い/バラエティ','スポーツ/フィットネス','キッズ/ファミリー','その他']
bmg_grandchild << ['邦楽','洋楽','その他']
bmg_grandchild << ['家庭用ゲーム本体','家庭用ゲームソフト','携帯用ゲーム本体','携帯用ゲームソフト','PCゲーム','その他']

parent_id_cnt = 0
bmg_child.each do |child|
  child = Category.create(category: child, ancestry: 5)
  bmg_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★おもちゃ・ホビー・グッズ
toy_child = ['おもちゃ','タレントグッズ','コミック/アニメグッズ','トレーディングカード','フィギュア','楽器/器材','コレクション','ミリタリー','美術品','アート用品','その他']

toy_grandchild = []
toy_grandchild << ['キャラクターグッズ','ぬいぐるみ','小物/アクセサリー','模型/プラモデル','ミニカー','トイラジコン','プラモデル','ホビーラジコン','鉄道模型','その他']
toy_grandchild << ['アイドル','ミュージシャン','タレント/お笑い芸人','スポーツ選手','その他']
toy_grandchild << ['ストラップ','キーホルダー','バッジ','カード','クリアファイル','ポスター','タオル','その他']
toy_grandchild << ['遊戯王','マジック：ザ・ギャザリング','ポケモンカードゲーム','デュエルマスターズ','バトルスピリッツ','プリパラ','アイカツ','カードファイト!! ヴァンガード','ヴァイスシュヴァルツ','プロ野球オーナーズリーグ','ベースボールヒーローズ','ドラゴンボール','スリーブ','その他']
toy_grandchild << ['コミック/アニメ','特撮','ゲームキャラクター','SF/ファンタジー/ホラー','アメコミ','スポーツ','ミリタリー','その他']
toy_grandchild << ['エレキギター','アコースティックギター','ベース','エフェクター','アンプ','弦楽器','管楽器','鍵盤楽器','打楽器','和楽器','楽譜/スコア','レコーディング/PA機器','DJ機器','DTM/DAW','その他']
toy_grandchild << ['武具','使用済切手/官製はがき','旧貨幣/金貨/銀貨/記念硬貨','印刷物','ノベルティグッズ','その他']
toy_grandchild << ['トイガン','個人装備','その他']
toy_grandchild << ['陶芸','ガラス','漆芸','金属工芸','絵画/タペストリ','版画','彫刻/オブジェクト','書','写真','その他']
toy_grandchild << ['画材','額縁','その他']
toy_grandchild << ['トランプ/UNO','カルタ/百人一首','ダーツ','ビリヤード','麻雀','パズル/ジグソーパズル','囲碁/将棋','オセロ/チェス','人生ゲーム','野球/サッカーゲーム','スポーツ','三輪車/乗り物','ヨーヨー','模型製作用品','鉄道','航空機','アマチュア無線','パチンコ/パチスロ','その他']

parent_id_cnt = 0
toy_child.each do |child|
  child = Category.create(category: child, ancestry: 6)
  toy_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★コスメ・香水・美容
beauty_child = ['ベースメイク','メイクアップ','ネイルケア','香水','スキンケア/基礎化粧品','ヘアケア','ボディケア','オーラルケア','リラクゼーション','ダイエット','その他']

beauty_grandchild = []
beauty_grandchild << ['ファンデーション','化粧下地','コントロールカラー','BBクリーム','CCクリーム','コンシーラー','フェイスパウダー','トライアルセット/サンプル','その他']
beauty_grandchild << ['アイシャドウ','口紅','リップグロス','リップライナー','チーク','フェイスカラー','マスカラ','アイライナー','つけまつげ','アイブロウペンシル','パウダーアイブロウ','眉マスカラ','トライアルセット/サンプル','メイク道具/化粧小物','美顔用品/美顔ローラー','その他']
beauty_grandchild << ['ネイルカラー','カラージェル','ネイルベースコート/トップコート','ネイルアート用品','ネイルパーツ','ネイルチップ/付け爪','手入れ用具','除光液','その他']
beauty_grandchild << ['香水(女性用)','香水(男性用)','ユニセックス','ボディミスト','その他']
beauty_grandchild << ['化粧水/ローション','乳液/ミルク','美容液','フェイスクリーム','洗顔料','クレンジング/メイク落とし','パック/フェイスマスク','ジェル/ゲル','ブースター/導入液','アイケア','リップケア','トライアルセット/サンプル','洗顔グッズ','その他']
beauty_grandchild << ['シャンプー','トリートメント','コンディショナー','リンス','スタイリング剤','カラーリング剤','ブラシ','その他']
beauty_grandchild << ['オイル/クリーム','ハンドクリーム','ローション','日焼け止め/サンオイル','ボディソープ','入浴剤','制汗/デオドラント','フットケア','その他']
beauty_grandchild << ['口臭防止/エチケット用品','歯ブラシ','その他']
beauty_grandchild << ['エッセンシャルオイル','芳香器','お香/香炉','キャンドル','リラクゼーショングッズ','その他']
beauty_grandchild << ['ダイエット食品','エクササイズ用品','体重計','体脂肪計','その他']
beauty_grandchild << ['健康用品','看護/介護用品','救急/衛生用品','その他']

parent_id_cnt = 0
beauty_child.each do |child|
  child = Category.create(category: child, ancestry: 7)
  beauty_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★家電・スマホ・カメラ
appliance_child = ['スマートフォン/携帯電話','スマホアクセサリー','PC/タブレット','カメラ','テレビ/映像機器','オーディオ機器','美容/健康','冷暖房/空調','生活家電','その他']

appliance_grandchild = []
appliance_grandchild << ['スマートフォン本体','バッテリー/充電器','携帯電話本体','PHS本体','その他']
appliance_grandchild << ['Android用ケース','iPhone用ケース','カバー','イヤホンジャック','ストラップ','フィルム','自撮り棒','その他']
appliance_grandchild << ['タブレット','ノートPC','デスクトップ型PC','ディスプレイ','電子ブックリーダー','PC周辺機器','PCパーツ','その他']
appliance_grandchild << ['デジタルカメラ','ビデオカメラ','レンズ(単焦点)','レンズ(ズーム)','フィルムカメラ','防犯カメラ','その他']
appliance_grandchild << ['テレビ','プロジェクター','ブルーレイレコーダー','DVDレコーダー','ブルーレイプレーヤー','DVDプレーヤー','映像用ケーブル','その他']
appliance_grandchild << ['ポータブルプレーヤー','イヤフォン','ヘッドフォン','アンプ','スピーカー','ケーブル/シールド','ラジオ','その他']
appliance_grandchild << ['ヘアドライヤー','ヘアアイロン','美容機器','電気シェーバー','電動歯ブラシ','その他']
appliance_grandchild << ['エアコン','空気清浄器','加湿器','扇風機','除湿機','ファンヒーター','電気ヒーター','オイルヒーター','ストーブ','ホットカーペット','こたつ','電気毛布','その他']
appliance_grandchild << ['冷蔵庫','洗濯機','炊飯器','電子レンジ/オーブン','調理機器','アイロン','掃除機','エスプレッソマシン','コーヒーメーカー','衣類乾燥機','その他']
appliance_grandchild << ['その他']

parent_id_cnt = 0
appliance_child.each do |child|
  child = Category.create(category: child, ancestry: 8)
  appliance_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★スポーツ・レジャー
sports_child = ['ゴルフ','フィッシング','自転車','トレーニング/エクササイズ','野球','サッカー/フットサル','テニス','スノーボード','スキー','その他スポーツ','アウトドア','その他']

sports_grandchild = []
sports_grandchild << ['クラブ','ウエア(男性用)','ウエア(女性用)','バッグ','シューズ(男性用)','シューズ(女性用)','アクセサリー','その他']
sports_grandchild << ['ロッド','リール','ルアー用品','ウエア','釣り糸/ライン','その他']
sports_grandchild << ['自転車本体','ウエア','パーツ','アクセサリー','バッグ','工具/メンテナンス','その他']
sports_grandchild << ['ランニング','ウォーキング','ヨガ','トレーニング用品','その他']
sports_grandchild << ['ウェア','シューズ','グローブ','バット','アクセサリー','防具','練習機器','記念グッズ','応援グッズ','その他']
sports_grandchild << ['ウェア','シューズ','ボール','アクセサリー','記念グッズ','応援グッズ','その他']
sports_grandchild << ['ラケット(硬式用)','ラケット(軟式用)','ウェア','シューズ','ボール','アクセサリー','記念グッズ','応援グッズ','その他']
sports_grandchild << ['ボード','バインディング','ブーツ(男性用)','ブーツ(女性用)','ブーツ(子ども用)','ウエア/装備(男性用)','ウエア/装備(女性用)','ウエア/装備(子ども用)','アクセサリー','バッグ','その他']
sports_grandchild << ['板','ブーツ(男性用)','ブーツ(女性用)','ブーツ(子ども用)','ビンディング','ウエア(男性用)','ウエア(女性用)','ウエア(子ども用)','ストック','その他']
sports_grandchild << ['ダンス/バレエ','サーフィン','バスケットボール','バドミントン','バレーボール','スケートボード','陸上競技','ラグビー','アメリカンフットボール','ボクシング','ボウリング','その他']
sports_grandchild << ['テント/タープ','ライト/ランタン','寝袋/寝具','テーブル/チェア','ストーブ/コンロ','調理器具','食器','登山用品','その他']
sports_grandchild << ['旅行用品','その他']

parent_id_cnt = 0
sports_child.each do |child|
  child = Category.create(category: child, ancestry: 9)
  sports_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★ハンドメイド
handmade_child = ['アクセサリー(女性用)','ファッション/小物','アクセサリー/時計','日用品/インテリア','趣味/おもちゃ','キッズ/ベビー','素材/材料','二次創作物','その他']

handmade_grandchild = []
handmade_grandchild << ['ピアス','イヤリング','ネックレス','ブレスレット','リング','チャーム','ヘアゴム','アンクレット','その他']
handmade_grandchild << ['バッグ(女性用)','バッグ(男性用)','財布(女性用)','財布(男性用)','ファッション雑貨','その他']
handmade_grandchild << ['アクセサリー(男性用)','時計(女性用)','時計(男性用)','その他']
handmade_grandchild << ['キッチン用品','家具','文房具','アート/写真','アロマ/キャンドル','フラワー/ガーデン','その他']
handmade_grandchild << ['クラフト/布製品','おもちゃ/人形','その他']
handmade_grandchild << ['ファッション雑貨','スタイ/よだれかけ','外出用品','ネームタグ','その他']
handmade_grandchild << ['各種パーツ','生地/糸','型紙/パターン','その他']
handmade_grandchild << ['Ingress','クリエイターズ宇宙兄弟','その他']
handmade_grandchild << ['その他']

parent_id_cnt = 0
handmade_child.each do |child|
  child = Category.create(category: child, ancestry: 10)
  handmade_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★チケット
ticket_child = ['音楽','スポーツ','演劇/芸能','イベント','映画','施設利用券','優待券/割引券','その他']

ticket_grandchild = []
ticket_grandchild << ['男性アイドル','女性アイドル','韓流','国内アーティスト','海外アーティスト','音楽フェス','声優/アニメ','その他']
ticket_grandchild << ['サッカー','野球','テニス','格闘技/プロレス','相撲/武道','ゴルフ','バレーボール','バスケットボール','モータースポーツ','ウィンタースポーツ','その他']
ticket_grandchild << ['ミュージカル','演劇','伝統芸能','落語','お笑い','オペラ','サーカス','バレエ','その他']
ticket_grandchild << ['声優/アニメ','キッズ/ファミリー','トークショー/講演会','その他']
ticket_grandchild << ['邦画','洋画','その他']
ticket_grandchild << ['遊園地/テーマパーク','美術館/博物館','スキー場','ゴルフ場','フィットネスクラブ','プール','ボウリング場','水族館','動物園','その他']
ticket_grandchild << ['ショッピング','レストラン/食事券','フード/ドリンク券','宿泊券','その他']
ticket_grandchild << ['その他']

parent_id_cnt = 0
ticket_child.each do |child|
  child = Category.create(category: child, ancestry: 11)
  ticket_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★自動車・オートバイ
car_child = ['自動車本体','自動車タイヤ/ホイール','自動車パーツ','自動車アクセサリー','オートバイ車体','オートバイパーツ','オートバイアクセサリー','その他']

car_grandchild = []
car_grandchild << ['国内自動車本体','外国自動車本体','その他']
car_grandchild << ['タイヤ/ホイールセット','タイヤ','ホイール','その他']
car_grandchild << ['サスペンション','ブレーキ','外装、エアロパーツ','ライト','内装品、シート','ステアリング','マフラー・排気系','エンジン、過給器、冷却装置','クラッチ、ミッション、駆動系','電装品','補強パーツ','汎用パーツ','外国自動車用パーツ','その他']
car_grandchild << ['車内アクセサリー','カーナビ','カーオーディオ','車外アクセサリー','メンテナンス用品','チャイルドシート','ドライブレコーダー','レーダー探知機','カタログ/マニュアル','セキュリティ','ETC','その他']
car_grandchild << ['その他']
car_grandchild << ['タイヤ','マフラー','エンジン、冷却装置','カウル、フェンダー、外装','サスペンション','ホイール','シート','ブレーキ','タンク','ライト、ウィンカー','チェーン、スプロケット、駆動系','メーター','電装系','ミラー','外国オートバイ用パーツ','その他']
car_grandchild << ['ヘルメット/シールド','バイクウエア/装備','アクセサリー','メンテナンス','カタログ/マニュアル','その他']
car_grandchild << ['その他']

parent_id_cnt = 0
car_child.each do |child|
  child = Category.create(category: child, ancestry: 12)
  car_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

# ★その他
other_child = ['まとめ売り','ペット用品','食品','飲料/酒','日用品/生活雑貨/旅行','アンティーク/コレクション','文房具/事務用品','事務/店舗用品','その他']

other_grandchild = []
other_grandchild << ['その他']
other_grandchild << ['ペットフード','犬用品','猫用品','魚用品/水草','小動物用品','爬虫類/両生類用品','かご/おり','鳥用品','虫類用品','その他']
other_grandchild << ['菓子','米','野菜','果物','調味料','魚介類(加工食品)','肉類(加工食品)','その他 加工食品','その他']
other_grandchild << ['コーヒー','ソフトドリンク','ミネラルウォーター','茶','ウイスキー','ワイン','ブランデー','焼酎','日本酒','ビール、発泡酒','その他']
other_grandchild << ['タオル/バス用品','日用品/生活雑貨','洗剤/柔軟剤','旅行用品','防災関連グッズ','その他']
other_grandchild << ['雑貨','工芸品','家具','印刷物','その他']
other_grandchild << ['筆記具','ノート/メモ帳','テープ/マスキングテープ','カレンダー/スケジュール','アルバム/スクラップ','ファイル/バインダー','はさみ/カッター','カードホルダー/名刺管理','のり/ホッチキス','その他']
other_grandchild << ['オフィス用品一般','オフィス家具','店舗用品','OA機器','ラッピング/包装','その他']
other_grandchild << ['その他']

parent_id_cnt = 0
other_child.each do |child|
  child = Category.create(category: child, ancestry: 13)
  other_grandchild[parent_id_cnt].each do |grandchild|
    child.children.create(category: grandchild)
  end
  parent_id_cnt += 1
end

Item.create!(
  [
    {
      name: 'adidasのスーパースター',
      description: '新品未使用です',
      ancestry:'2',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースターレインボー',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      status:'1',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースター黒',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースター黄色',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースター緑',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースター赤',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースター青',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'1',
      user_id:'1',
      category_id:'159',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      name: 'adidasのスーパースター茶色',
      description: '新品未使用です',
      ancestry:'1',
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
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
      price: '300',
      region:'沖縄県',
      delivery_fee: '2',
      delivery_days:'2~3日で発送',
      shipping_method:'らくらくメルカリ便',
      size:'26cm',
      saved_state:'新品/未使用',
      brand_id:'2',
      user_id:'2',
      category_id:'159',
      created_at: '2019-09-20 01:00:00',
      updated_at: '2019-09-20 01:00:00',
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
      image: open("#{Rails.root}/app/assets/images/seed/img5.jpg"),
      item_id:'2',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img7.jpg"),
      item_id:'4',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image:open("#{Rails.root}/app/assets/images/seed/img8.jpg"),
      item_id:'5',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img9.jpg"),
      item_id:'6',
      created_at: '2019-09-20 00:00:00',
      updated_at: '2019-09-20 00:00:00',
    },
    {
      image: open("#{Rails.root}/app/assets/images/seed/img10.jpeg"),
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