class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :books, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy

  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  # フォローを取得
  has_many :followings, through: :relationships, source: :followed
  # 自分がフォローしている人を取得 フォローする側
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'followed_id'
  # フォロワーを取得
  has_many :followers, through: :reverse_of_relationships, source: :follower
  # 自分のことをフォローしている人を取得　フォローされる側

  attachment :profile_image
  validates :name, presence: true, length: { in:2..20 }, uniqueness: true
  validates :introduction, length: { maximum: 50 }

  def follow(other_user)
    unless self == other_user
      self.relationships.find_or_create_by(followed_id: other_user.id)
    end
  end

  def unfollow(other_user)
    relationship = self.relationships.find_by(followed_id: other_user.id)
    relationship.destroy if relationship
  end

  def following?(other_user)
    self.followings.include?(other_user)
  end


end
