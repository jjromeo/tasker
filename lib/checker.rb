class Checker 
  attr_accessor :list, :time

  def initialize(list)
    @list = list
    @time = Time.now
  end
  
  def current_time
    @time.strftime("%-l:%M %p").downcase
  end

  def set_work_time(start_time, end_time)
    @work_start_time = Time.parse(start_time)
    @work_end_time = Time.parse(end_time)
  end
  
  def current_date
    @time.strftime("%d/%m/%Y")
  end

  def current_location
      if @work_start_time && @work_end_time
        return "work" if @time.between?(@work_start_time, @work_end_time)
        return "home"
      else
        "unknown"
      end
  end

  def what_now
    todo_now = order_tasks(get_tasks).first.action unless get_tasks.empty?
    return todo_now if todo_now
    raise "No task currently set"
  end

  def get_tasks
    tasks_for_now = []
       selected_tasks = @list.todo.select do |task|
        if task.due_time == "N/A"
            task.location == current_location
        else
          due_time = Time.parse(task.due_time)
          @time.between?(due_time, (due_time + task.time_required * 60))
        end
       end
       tasks_for_now.concat(selected_tasks)
  end

  def order_tasks(task_array)
      set_tasks = task_array.select {|task| task.type == "set-time"}
      if set_tasks.empty?
        return order_by_priority(task_array)
      else
        return order_by_priority(set_tasks)
      end
  end

  def order_by_priority(task_array)
    task_array.sort {|x, y| y.priority <=> x.priority}
  end

end
