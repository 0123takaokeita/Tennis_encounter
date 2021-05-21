# 設計

## users                 
|colum                |type   |option       |補足        |
|---------------------|-------|-------------|-----------|
|nickname             |string | null:false  |名前        |  
|email                |string | null:false  |アドレス     |
|gender               |string | null:false  |性別        |    
|encrypted_password   |string | null:false  |暗号        |  
|age                  |date   |null:false   |年齢        |  

### association
has_many :comments
has_many :promises
has_many :bookmarks
has_many :plans
belongs_to : profile
has_many :follows



## profiles
|colum              |type    |option            |補足                       |    
|-------------------|--------|------------------|--------------------------|
|starting_age       |integer |null:false        |開始年齢                    |
|introduction       |text    |                  |自己紹介文                  |
|prefecture_id      |integer |null:false        |都道府県、アクティブハッシュ   |
|racket             |string  |                  |使用ラケット                |
|club               |string  |                  |所属クラブ                  |
|court_type         |string  |null:false        |対応可能コート、プルダウン式   |
|battle_history_id  |integer |foreign_key: true |戦歴の外部キー               |
|user_id            |integer |foreign_key: true |ユーザーの外部キー           |

## association
belongs_to :profile 

## comments
|colum   |type    |option           |補足               |
|--------|--------|-----------------|------------------|
|content |text    |null:false       |コメントテキスト     |
|user_id |integer |foreign_key: true|ユーザーの外部キー   |
|plan_id |integer |foreign_key: true|募集の外部キー      |

### association
belongs_to :user
belongs_to :plans
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
belongs_to: plan
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
## battle_histories
|colum      |type    |option            |補足                |
|-----------|--------|------------------|-------------------|
|winner_id  |integer |null:false        |勝者のID            |
|loser_id   |integer |null:false        |敗者のID            |
|plan_id |integer |foreign_key: true |募集の外部キー |

### association
belongs_to :plan
has_many :evaluations
## evaluations
|colum              |type   |option           |補足          |
|-------------------|-------|-----------------|--------------|
|seder_id           |integer|null:false       |評価する人　　|
|receiver_id        |integer|null:false       |評価される人　　|
|battle_history_id  |integer|foreign_key:true |対戦記録の外部キー　　|
|attitude           |integer|null:false       |態度　　|
|rob                |integer|null:false       |ロブ　　|
|stroke             |integer|null:false       |ストローク　　|
|volley             |integer|null:false       |ボレー　　|
|saab               |integer|null:false       |サーブ　　|
|strategy           |integer|null:false       |戦略　　|
|impressions        |text   |                 |感想　　|

### association
belongs_to :battle_histories
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
|user_id   |integer |foreign_key: true |ユーザー外部キー |

### association
belongs_to :battle_history
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