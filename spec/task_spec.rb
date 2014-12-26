describe Task do 

  it 'on initialization is not completed' do 
    task = Task.new
    expect(task).not_to be_completed
  end

  it 'can be completed' do 
    task = Task.new 
    task.mark_as_completed
    expect(task).to be_completed
  end

end
