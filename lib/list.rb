class List
  attr_accessor :tasks
  def initialize 
    @tasks = []
  end

  def add_task(task)
    if task.class == Task
      tasks << task 
    else 
      raise "Only tasks can be added to the list"
    end
  end

  def todo 
    tasks.reject { |task| task.completed?}
  end

  def finished 
    tasks.select { |task| task.completed?}
  end

  def tick_off(task)
    task.mark_as_completed
  end
end
