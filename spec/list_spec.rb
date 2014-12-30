describe List do
  let(:list) { List.new }
  let(:task) { double 'task', completed?: false, mark_as_completed: false, class: Task }
  let(:completed_task) { double 'task', completed?: true, class: Task }

  it 'does not contain any tasks on initialization' do
    expect(list.tasks.count).to eq 0
  end

  it 'can add tasks into the list' do
    list.add_task(task)
    expect(list.tasks.count).to eq 1
  end

  it 'can only add tasks to the list' do
    non_task = double 'non_task', class: 'NotTask'
    expect { list.add_task(non_task) }
      .to raise_error 'Only tasks can be added to the list'
  end

  it 'can list its tasks which are not yet completed' do
    list.add_task(task)
    list.add_task(completed_task)
    expect(list.tasks.count).to eq 2
    expect(list.todo.count).to eq 1
  end

  it 'can list its completed tasks' do
    list.add_task(task)
    list.add_task(completed_task)
    expect(list.tasks.count).to eq 2
    expect(list.finished.count).to eq 1
  end

  it 'can mark tasks as completed' do
    list.add_task(task)
    expect(task).to receive(:mark_as_completed)
    list.tick_off(task)
  end
end
