describe Task do 

  let(:task) {Task.new}

  it 'on initialization is not completed' do 
    expect(task).not_to be_completed
  end

  it 'can be completed' do 
    task.mark_as_completed
    expect(task).to be_completed
  end

  it 'can be initialized with an action' do 
    task2 = Task.new(action:"tidy my room")
    expect(task2.action).to eq "tidy my room"
  end

  it 'can be initialized with a time required' do 
    task2 = Task.new(time_required: 20)
    expect(task2.time_required).to eq 20
  end

  it 'can be initialized with a recurring status' do 
    task2 = Task.new(recurring: true)
    expect(task2.recurring).to eq true
  end
  
  it 'can be initialized with a due date' do 
    task2 = Task.new(due_date: "today")
    expect(task2.due_date).to eq "today"
  end

  it 'can be initialized with a priority level' do 
    task2 = Task.new(priority: "NOW")
    expect(task2.priority).to eq "NOW"
  end

end
