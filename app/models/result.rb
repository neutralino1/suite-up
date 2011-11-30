class Result < ActiveRecord::Base
  belongs_to :case
  belongs_to :round

  def fail?
    status == "fail"
  end

  def pass?
    status == "pass"
  end

  def none?
    status == "none"
  end
end
