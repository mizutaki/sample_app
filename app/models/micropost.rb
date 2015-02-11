class Micropost < ActiveRecord::Base
	#参照元テーブルから参照先テーブルにアクセスする Micropost → User
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	#contentが空じゃないかつ140文字を超えない
	validates :content, presence: true, length: { maximum: 140 }
	#user_idが空でないか
	validates :user_id, presence: true

	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships WHERE follower_id = :user_id"
		where("user_id IN(#{followed_user_ids}) OR user_id = :user_id", user_id: user.id)
	end
end
