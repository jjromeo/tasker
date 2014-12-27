describe List do 
  let(:list) {List.new}
  let (:task) { double "task", completed?: false }
  let (:completed_task) { double "task", completed?: true}

  it 'does not contain any tasks on initialization' do 
    expect(list.tasks.count).to eq 0
  end

  it 'can add tasks into the list' do 
    list.add_task(task)
    expect(list.tasks.count).to eq 1
  end

  it 'can list its tasks which are not yet completed' do 
    list.add_task(task) 
    list.add_task(completed_task) 
    expect(list.tasks.count).to eq 2
    expect(list.todo.count).to eq 1
  end

end
