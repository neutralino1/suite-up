class Round < ActiveRecord::Base
  belongs_to :theme
  has_many :results

  def status
    none_count = results.count(:conditions =>{:status =>'none'})
    fail_count = results.count(:conditions =>{:status =>'fail'})
    pass_count = results.count(:conditions =>{:status =>'pass'})
    return 'ongoing' if none_count > 0
    return 'fail' if fail_count > 0
    return 'pass' if pass_count > 0
    return 'ongoing'
  end

  def pass?
    status == 'pass'
  end

  def fail?
    status == 'fail'
  end

end
