class Task 

  attr_reader :attributes

  def initialize(attributes = {})
    @attributes = attributes
    @completed = false
  end

  def completed?
    @completed
  end


  def mark_as_completed
    @completed = true
  end

  def action
    attributes[:action]
  end

  def time_required
    attributes[:time_required]
  end

  def recurring?
    attributes[:recurring]
  end

  def due_date
    attributes[:due_date]
  end

  def priority 
    attributes[:priority]
  end
end
