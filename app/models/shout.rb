class Shout < ActiveRecord::Base
  validates_presence_of :body
  
  def self.most_recent
    order("created_at desc")
  end
end
