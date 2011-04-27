class Shout < ActiveRecord::Base
  belongs_to :user

  validates_presence_of :body
  
  def self.most_recent
    order("created_at desc")
  end
  

end
