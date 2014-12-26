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

  def method_missing(method)
    attribute = attributes[method.to_sym]
    if attribute
      attribute
    else
      super
    end
  end
end
