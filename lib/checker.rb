class Checker 
  attr_accessor :list, :time
  def initialize(list)
    @list = list
    @time = Time.now
  end
  
  def current_time
    @time.strftime("%-l:%M %p").downcase
  end
  
  def current_date
    @time.strftime("%d/%m/%Y")
  end

end
