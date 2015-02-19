class Campaign < ActiveRecord::Base
  belongs_to :owner, class_name: "User", foreign_key: "owner_id"

  has_many :membership
  has_many :users, through: :membership
end
