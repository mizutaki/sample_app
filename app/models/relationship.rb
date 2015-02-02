class Relationship < ActiveRecord::Base
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"
	#follower_id,followed_idに値が存在すれば検証成功という意味
	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
