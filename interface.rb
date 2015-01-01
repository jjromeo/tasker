require './lib/task.rb'
require './lib/list.rb'
require './lib/checker.rb'

list = List.new
checker = Checker.new(list)

puts "Welcome to tasker"

puts "================="

puts "Please add a task"

def create_params
  puts 'What is the task?'
  action = gets.chomp
  loop do 
    puts 'is it continuous or a set-time task?'
    type = gets.chomp
    break if type == 'set-time' || type == 'continuous'
  end
  puts 'what date must it be done on?'
  due_date = gets.chomp
end

def add_task(attributes) 
  list.add_task(Task.new(attributes))
end


