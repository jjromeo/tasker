class List
  attr_accessor :tasks
  def initialize 
    @tasks = []
  end

  def add_task(task)
    tasks << task
  end

  def todo 
    tasks.select { |task| task.completed?}
  end
end
