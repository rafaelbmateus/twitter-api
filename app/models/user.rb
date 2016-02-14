class User < ActiveRecord::Base
  has_many :tweets, dependent: :destroy
  validates :name,  presence: true, length: { maximum: 50 }
end
