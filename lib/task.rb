# for storing details of a class
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

  # method_missing allows access to all attributes in @attributes by calling
  # task.<attribute>
  # and
  # allows changing the value of attributes by calling task.change_<attribute>

  def method_missing(method, change_value = nil)
    method_string = method.to_s
    attribute = attributes[method.to_sym]
    if attribute || method_string.slice(0..6) == 'change_'
      return parse_attribute(method_string, attribute, change_value)
    end
    super
  end

  private

  def parse_attribute(method_string, attribute, change_value)
    if (_method_has_change_ = method_string.slice(0..6) == 'change_')
      key = method_string.slice(7..-1)
      attributes[key.to_sym] = change_value
    elsif attribute
      attribute
    end
  end
end
