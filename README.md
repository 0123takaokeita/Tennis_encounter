# 設計

## users                 
|colum                |type   |option       |補足        |
|---------------------|-------|-------------|-----------|
|nickname             |string | null:false  |名前        |  
|email                |string | null:false  |アドレス     |
|gender               |string | null:false  |性別        |    
|encrypted_password   |string | null:false  |暗号        |  
|age                  |date   |null:false   |年齢        |  

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

## comments
|colum   |type    |option           |補足               |
|--------|--------|-----------------|------------------|
|content |text    |null:false       |コメントテキスト     |
|user_id |integer |foreign_key: true|ユーザーの外部キー   |
|plan_id |integer |foreign_key: true|募集の外部キー      |

## promises
|colum   |type    |option            |補足             |
|--------|--------|------------------|----------------|
|plan_id |integer |foreign_key: true |募集の外部キー    |
|user_id |integer |foreign_key: true |ユーザーの外部キー |

## bookmarks
|colum   |type   |option           |補足             |
|--------|-------|-----------------|----------------|
|plan_id |integer|foreign_key: true|募集の外部キー     |    
|user_id |integer|foreign_key: true|ユーザーの外部キー |        

## authentications
|colum    |type    |option             |補足            |
|---------|--------|-------------------|---------------|
|uid      |string  |null: false        |APIのユーザーID  |
|user_id  |integer |foreign_key: true  |ユーザーの外部キー|
|provider |string  |null: false        |プロバイダの識別  |

## follows
|colum       |type      |option            |補足                 |
|------------|----------|------------------|--------------------|
|user_id     |integer   |foreign_key: true | ユーザー外部キー      |
|followed_id |integer   |null: false       | フォローしたユーザーID |

## battle_histories
|colum      |type    |option            |補足                |
|-----------|--------|------------------|-------------------|
|winner_id  |integer |null:false        |勝者のID            |
|loser_id   |integer |null:false        |敗者のID            |
|profile_id |integer |foreign_key: true |プロフィールの外部キー |

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

## tag_relations
|colum    |type    |option            |補足          |
|---------|--------|------------------|-------------|
|tag_id   |integer |foreign_key: true |タグの外部キー |
|plan_id  |integer |foreign_key: true |募集の外部キー　|

## tags
|colum    |type   |option            |補足      |
|---------|-------|------------------|----------|
|tag_name |integer|foreign_key: true |タグの名前  |