class Task 

  attr_accessor :action, :time_required

  def initialize(data_hash = {})
    @action = data_hash[:action]
    @time_required = data_hash[:time_required]
    @completed = false
  end

  def completed?
    @completed
  end

  def mark_as_completed
    @completed = true
  end

end
