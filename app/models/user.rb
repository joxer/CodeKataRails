class User < ActiveRecord::Base
  belongs_to :role
  has_many :concerts

  validates :password, presence: true

  def isAdmin?
    role != nil && role.role == "admin"
  end
  
  def isUser?
    role != nil && role.role == "user"
  end

  def isGuest?
    role.role == nil || role.role == "guest"
  end
end
