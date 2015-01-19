class Micropost < ActiveRecord::Base
	#参照元テーブルから参照先テーブルにアクセスする Micropost → User
	belongs_to :user
	#user_idが空でないか
	validates :user_id, presence: true
end
