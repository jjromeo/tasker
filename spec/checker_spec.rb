describe Checker do 
  let(:task) {double "task", action: "Study angularjs", due_date: "none", due_time: "N/A", time_required: "N/A", type: "continuous", location: "home", priority: 3 }
  let(:task2) {double "task", action: "Go to the gym", due_date: "28/12/2014", due_time: "6:00 pm", time_required: 60, type:"set-time", priority: 1, location: "home" }
  let(:task3) {double "task", action: "Go to the shops", due_date: "28/12/2014", due_time: "6:00 pm", time_required: 60, type:"set-time", priority: 5 }
  let(:list) {double "list", tasks: [task, task2], todo: [task, task2] }
  let(:checker) {Checker.new(list)}

  before do 
    Timecop.freeze(Time.local(2014, 12, 28, 18, 19, 0))
  end

  it 'can be initialized with a list' do 
    expect(checker.list).to eq(list)
  end

  it 'knows what the time is' do 
    expect(checker.current_time).to eq "6:19 pm"
  end

  it 'knows what the date is' do 
    expect(checker.current_date).to eq "28/12/2014"
  end

  it 'knows whether you are at home or at work' do 
    checker.set_work_time("9:00 am", "5:00pm")
    expect(checker.current_location).to eq "home"
  end

  context 'Task Checking' do 

    it 'Will choose a set-task rather than a continuous one if there is one due now' do 
      expect(checker.what_now).to eq "Go to the gym"
    end


    it 'Will default to a continuous task if no set-task is due now' do
      Timecop.freeze(Time.local(2014, 12, 28, 14, 19, 0))
      expect(checker.what_now).to eq 'Study angularjs' 
    end

    it 'Will choose a different continuous task depending on users\' location' do 
      Timecop.freeze(Time.local(2014, 12, 28, 16, 19, 0))
      task4 = double("task", action: "Create some websites", type: "continuous", location:"work", priority: 3, due_date: "N/A")
      list2 = double("list", todo: [task, task2, task3, task4])
      checker2 = Checker.new(list2)
      checker2.set_work_time("9:00 am", "5:00 pm")
      expect(checker2.what_now).to eq "Create some websites"
    end

    it 'Will tell you to do the task with the highest priority if there is a clash' do 
      list2 = double("list", todo: [task, task2, task3])
      checker2 = Checker.new(list2)
      expect(checker2.what_now).to eq "Go to the shops"
    end

  end

end
