class Theme < ActiveRecord::Base
  has_many :cases
  has_many :rounds
  
  def last_round
    rounds.order("created_at desc").first
  end
end
