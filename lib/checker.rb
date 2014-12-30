# communicates with given list and tasks to show what task 
# should be done
class Checker
  attr_accessor :list, :time

  def initialize(list)
    @list = list
    @time = Time.now
  end

  def current_time
    @time.strftime('%-l:%M %p').downcase
  end

  def set_work_time(start_time, end_time)
    @work_start_time = Time.parse(start_time)
    @work_end_time = Time.parse(end_time)
  end

  def current_date
    @time.strftime('%d/%m/%Y')
  end

  def current_location
    if @work_start_time && @work_end_time
      return 'work' if @time.between?(@work_start_time, @work_end_time)
      return 'home'
    else
      'unknown'
    end
  end

  def what_now
    return todo_now = order_tasks(potential_tasks).first.action unless potential_tasks.empty?
    fail 'No task currently set'
  end

  private 

  def order_tasks(task_array)
    if task_array.any? { |task| task.type == 'set-time' }
      task_array.reject! { |task| task.type == 'continuous' }
    end
      order_by_priority(task_array)
  end

  def order_by_priority(task_array)
    task_array.sort { |first_task, second_task| second_task.priority <=> first_task.priority }
  end

  def potential_tasks
    @tasks_for_now = []
    insert_continuous_tasks
    insert_set_time_tasks
    @tasks_for_now
  end

  def insert_continuous_tasks
    continuous_tasks.each do |task|
      next if current_location != 'unknown' && current_location != task.location
      @tasks_for_now << task 
    end
  end

  def continuous_tasks
    @list.todo.select { |task| task.type == 'continuous' }
  end
  
  def insert_set_time_tasks
    set_time_tasks.each do |task|
       due_time = Time.parse(task.due_time)
       @tasks_for_now << task if @time.between?(due_time, (due_time + task.time_required * 60))
    end
  end

  def set_time_tasks
    @list.todo.select { |task| task.type == 'set-time' }
  end

end
