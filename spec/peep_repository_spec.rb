require 'peep'
require 'peep_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe PeepRepository do
  before(:each) do
    reset_tables
  end
  
    # it 'finds all peeps' do #def all method
    #   repo = PeepRepository.new
  
    #   peep = repo.all
  
    #   expect(peep.length).to eq(9)
    #   expect(peep.first.peep_text).to eq('Full moon tonight!')
    #   expect(peep.first.username).to eq('shinning_moon')
    #   expect(peep.last.time_tag).to eq('2023-04-12 10:01:00')
    # end

  it 'lists peeps in reverse chronological order' do
    repo = PeepRepository.new

    peep = repo.sort_by_rev_time

    expect(peep.length).to eq(5)
    expect(peep.first.peep_text).to eq('Hey there')
    expect(peep.first.id).to eq(3)
    expect(peep.last.id).to eq(1)
    # expect(peep.first.username).to eq('good_boy')
    expect(peep.last.time_tag).to eq('2023-04-11 10:00:00')
  end
end
