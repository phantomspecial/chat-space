# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## groupsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-------|

  Association
  - has_many :users, through: :group_users
  - has_many :group_users
  - has_many :messages


## usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|-------|
|password |string|-------|
|email|integer|unique: true|
|name|string|null: false|

  Association
  - user.rb
  - has_many :groups, through: :group_users
  - has_many :group_users
  - has_many :messages


## messagesテーブル
|Column|Type|Options|
|------|----|-------|
|body  |text|-------|
|image |string|-------|
|group_id|integer|foreign_key: true|
|user_id|integer|foreign_key: true|

  Association
  - message.rb
  - belongs_to :user
  - belongs_to :group

## group_usersテーブル(中間テーブル)

|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|group_id|integer|null: false, foreign_key: true|

  Association
  - group_user.rb
  - belongs_to :group
  - belongs_to :user


### index
- add_index :groups, :groupname
- add_index :users, :username
