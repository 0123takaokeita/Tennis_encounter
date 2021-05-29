# アプリ名
Tennis encounter

# 内容
テニスのプレイヤー同士のマッチング記録アプリケーション。
アプリを使って対戦を募集・記録することで競技者の経験値の向上と地域交流の活発化を期待して作成している。
試合経験を積みたいけど対戦相手を見つけることがなかなかできない（自分よりレベルの高い人ばかり見つかる。）そんな経験からの着想である。
やる気があるのにくすぶっているプレイヤーに使用してもらいたい。


# ペルソナ
- コンペ以外でも試合経験を積んで行きたい向上心のあるプレイヤー
- 自分にあった対戦相手がなかなか見つけられないプレイヤー
- コンペ以外でも地域外にでて活動したいと思っているプレイヤー
- 主にシングルスプレイヤー向け


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
has_many   :comments
has_many   :promises
has_many   :bookmarks
has_many   :plans
belongs_to :profile
has_many   :follows
belongs_to :authentications



## profiles
|colum              |type    |option            |補足                       |    
|-------------------|--------|------------------|--------------------------|
|starting_age       |integer |                  |開始年齢                    |
|introduction       |text    |                  |自己紹介文                  |
|prefecture_id      |integer |                  |都道府県、アクティブハッシュ   |
|racket             |string  |                  |使用ラケット                |
|club               |string  |                  |所属クラブ                  |
|court_type         |string  |                  |対応可能コート、プルダウン式   |
|user_id            |integer |foreign_key: true |ユーザーの外部キー           |

## association
belongs_to :user

## comments
|colum   |type    |option           |補足               |
|--------|--------|-----------------|------------------|
|content |text    |null:false       |コメントテキスト     |
|user_id |integer |foreign_key: true|ユーザーの外部キー   |
|plan_id |integer |foreign_key: true|募集の外部キー      |

### association
belongs_to :user
belongs_to :plan
## promises
|colum   |type    |option            |補足             |
|--------|--------|------------------|----------------|
|plan_id |integer |foreign_key: true |募集の外部キー    |
|user_id |integer |foreign_key: true |ユーザーの外部キー |

### association
belongs_to :user
belongs_to :plan
## bookmarks
|colum   |type   |option           |補足             |
|--------|-------|-----------------|----------------|
|plan_id |integer|foreign_key: true|募集の外部キー     |    
|user_id |integer|foreign_key: true|ユーザーの外部キー |        

### association
belongs_to :user
belongs_to :plan
## authentications
|colum    |type    |option             |補足            |
|---------|--------|-------------------|---------------|
|uid      |string  |null: false        |APIのユーザーID  |
|user_id  |integer |foreign_key: true  |ユーザーの外部キー|
|provider |string  |null: false        |プロバイダの識別  |

### association
belongs_to :user
## follows
|colum       |type      |option            |補足                 |
|------------|----------|------------------|--------------------|
|user_id     |integer   |foreign_key: true | ユーザー外部キー      |
|followed_id |integer   |null: false       | フォローしたユーザーID |

### association
belongs_to :user
## evaluations
|colum              |type   |option           |補足          |
|-------------------|-------|-----------------|--------------|
|sender_id          |integer|null:false       |評価する人　　|
|receiver_id        |integer|null:false       |評価される人　　|
|plan_id            |integer|foreign_key:true |募集の外部キー　　|
|attitude           |integer|null:false       |態度　　|
|rob                |integer|null:false       |ロブ　　|
|stroke             |integer|null:false       |ストローク　　|
|volley             |integer|null:false       |ボレー　　|
|saab               |integer|null:false       |サーブ　　|
|strategy           |integer|null:false       |戦略　　|
|impression         |text   |                 |感想　　|

### association
belongs_to :plan
## plans
|colum     |type    |option            |補足         |
|----------|--------|------------------|-------------|
|plan_name |string  |null: false       |募集タイトル   |
|address   |string  |null: false       |住所          |
|start_time|date    |null: false       |開始時間       |
|end_time  |date    |null: false       |終了時間       |
|price     |integer |null: false       |参加費用       |
|court_type|string  |null: false       |コートの種類    |
|ball_name |string  |                  |ボールの種類    |
|level     |string  |null: false       |競技レベル      |
|rule      |string  |null: false       |競技ルール      |
|winner_id |integer |                  |勝者のID       |
|loser_id  |integer |                  |敗者のID       |
|user_id   |integer |foreign_key: true |ユーザー外部キー |

### association
has_many :plan_tags
has_many :tags, through: :plan_tags
## tag_relations
|colum    |type    |option            |補足          |
|---------|--------|------------------|-------------|
|tag_id   |integer |foreign_key: true |タグの外部キー |
|plan_id  |integer |foreign_key: true |募集の外部キー　|

### association
belongs_to :plan
belongs_to :tag

## tags
|colum    |type   |option            |補足      |
|---------|-------|------------------|----------|
|tag_name |integer|foreign_key: true |タグの名前  |
### association
has_many :plan_tags
has_many :plan, though: :plan_tags