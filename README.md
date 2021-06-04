# アプリ名
Tennis encounter

# 内容
テニスプレイヤーのパラメーターを可視化して個人のスキルアップに役立てるアプリケーションです。
試合の結果から対戦相手に評価をしてもらい、自分のパラメータが作成されます。
苦手分野への対策や見えていなかった特徴を考える切っ掛けになるように作成をしています。


# ターゲット
- 試合のシートを記入してもらうほどのサポートが受けられない人
- 試合のときに自分で考える力を伸ばしたい人
- 考える力を伸ばす指導をしたいコーチ
- ゲーム感覚で楽しく続けたいライト層にも


# 使用技術
- Ruby 2.7.0
- Ruby on Rails 6.0.3.7
- node 14.16.0
- tail wind css
- Rspec 
# 設計

## users                 
|colum                |type   |option       |補足        |
|---------------------|-------|-------------|-----------|
|nickname             |string | null:false, unique: true  |名前        |  
|email                |string | null:false  |アドレス     |
|gender_id            |integer| null:false  |性別 　アクティブハッシュ |    
|encrypted_password   |string | null:false  |暗号        |  
|age                  |date   |null:false   |年齢        |  

## association
has_many :plans
hasa_many :comments


## profiles
|colum              |type    |option            |補足                       |    
|-------------------|--------|------------------|--------------------------|
|introduction       |text    |                  |自己紹介文                  |
|prefecture_id      |integer |                  |都道府県、アクティブハッシュ   |
|club               |string  |                  |所属クラブ                  |
|user_id            |integer |foreign_key: true |ユーザーの外部キー           |

## association
belongs_to :user

## comments
|colum   |type    |option           |補足               |
|--------|--------|-----------------|------------------|
|memo    |text    |null:false       |コメントテキスト     |
|user_id |integer |foreign_key: true|ユーザーの外部キー   |
|plan_id |integer |foreign_key: true|募集の外部キー      |

### association
belongs_to :user
belongs_to :plan

## score
|colum              |type   |option           |補足          |
|-------------------|-------|-----------------|--------------|
|user_id | integer | foreign_key: true |ユーザーの外部キー|
|receiver_id | integer | null: false | 対戦相手のID |
|f_slice | integer | null: false | フォアスライス |
|b_slice |integer  |null: false |バックスライス  |
|f_spin |integer  |null: false  |フォアスピン  |
|b_spin |integer  |null: false  |バックスピン  |
|f_volley |integer  |null: false  |フォアボレー  |
|b_volley |integer  |null: false  |バックボレー  |
|sp_saab  |integer  |null: false  |スピンサーブ  |
|sl_saab  |integer  |null: false  |スライスサーブ  |
|f_saab |integer  |null: false  |フラットサーブ  |
|impression |text  |null: false |感想  |
|etiquette |integer  |null: false |エチケット  |
|miss |integer  |null: false  |ミスショット  |
|plan_id  |integer  |foreign_key: true | 募集のID　|

## association
belongs_to :plan
belongs_to :user


## plans
|colum     |type    |option            |補足         |
|----------|--------|------------------|-------------|
|plan_name |string  |null: false       |募集タイトル   |
|address   |string  |null: false       |住所          |
|start_time|date    |null: false       |開始時間       |
|end_time  |date    |null: false       |終了時間       |
|price     |integer |null: false       |参加費用       |
|court_type|string  |null: false       |コートの種類    |
|rule      |string  |null: false       |競技ルール      |
|winner_id |integer |                  |勝者のID       |
|loser_id  |integer |                  |敗者のID       |
|user_id   |integer |foreign_key: true |ユーザー外部キー |

## association
belongs_to :user
has_many :comments
has_many :scores
