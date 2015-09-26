class UserToken < ActiveRecord::Base
  belongs_to :user


  def self.generate_user_token(user)

    date = DateTime.now.to_date
    
    records = UserToken.where("user_id = ? AND start_date >= ? AND end_date >= ?", user.id , date, date)
    if records != []
      records.first
    else
      @user_token = UserToken.new
      @user_token.user = user
      @user_token.token = SecureRandom.hex(8)
      @user_token.save
      @user_token.start_date = DateTime.now
      @user_token.end_date = DateTime.now + 7
      @user_token.save
      @user_token
    end
  end
end
