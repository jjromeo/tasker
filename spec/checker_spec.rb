describe Checker do 
  let(:list) {double "list"}
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



end
