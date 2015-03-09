class Campaign < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  has_many :membership
  has_many :users, through: :membership
  has_many :characters
  has_many :notes

  validates :title, presence: true, 
  			length: { maximum: 50 },
  			uniqueness: { case_sensitive: false }
  validates :description, presence: true, 
  			length: { maximum: 140 }
  validates :owner, presence: true
end
