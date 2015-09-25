class Concert < ActiveRecord::Base
  belongs_to :band
  belongs_to :user

  def pretty_json
    self.to_json(:only => [:id, :position,:location])
  end
  
end
