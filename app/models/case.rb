class Case < ActiveRecord::Base
  belongs_to :theme
  has_many :results
end
