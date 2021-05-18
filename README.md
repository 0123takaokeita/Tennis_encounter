# 設計

## users                 
|colum                |type   |option       |
|---------------------|-------|-------------|
|nickname             |string | null:false  |　名前
|email                |string | null:false  |　アドレス
|encrypted_password   |string | null:false  |　暗号
|age                  |date   |null:false   |  年齢

## profiles
|colum              |type    |option            |      
|-------------------|--------|------------------|
|starting_age       |integer |null:false        |開始年齢         
|introduction       |text    |                  |自己紹介文 
|prefecture_id      |integer |null:false        |都道府県、アクティブハッシュ
|racket             |string  |                  |使用ラケット 
|club               |string  |                  |所属クラブ
|court_type         |string  |null:false        |対応可能コート、プルダウン式
|battle_history_id  |integer |foreign_key: true |戦歴の外部キー
|user_id            |integer |foreign_key: true |ユーザーの外部キー  

## comments
|colum   |type    |option           |
|--------|--------|-----------------|      
|content |text    |null:false       |コメントテキスト
|user_id |integer |foreign_key: true|ユーザーの外部キー
|plan_id |integer |foreign_key: true|募集の外部キー

## promises
|colum   |type    |option            |        
|--------|--------|------------------|
|plan_id |integer |foreign_key: true |募集の外部キー
|user_id |integer |foreign_key: true |ユーザーの外部キー