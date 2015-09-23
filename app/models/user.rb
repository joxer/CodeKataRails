class User < ActiveRecord::Base
  belongs_to :role

  validates :password, presence: true
  
end
