class Band < ActiveRecord::Base
  has_many :concerts

  def pretty_json
     self.to_json(:only => [:id, :name, :description])
  end

end
