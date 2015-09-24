class User < ActiveRecord::Base
  belongs_to :role
  has_many :concerts

  validates :password, presence: true
  
end
