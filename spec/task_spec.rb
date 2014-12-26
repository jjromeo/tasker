describe Task do 

  let(:task) {Task.new}

  it 'on initialization is not completed' do 
    expect(task).not_to be_completed
  end

  it 'can be completed' do 
    task.mark_as_completed
    expect(task).to be_completed
  end

  it 'can be initialized with certain attributes' do 
    task2 = Task.new(action:"tidy my room", time_required: 20)
    expect(task2.action).to eq "tidy my room"
    expect(task2.time_required).to eq 20
  end

end
