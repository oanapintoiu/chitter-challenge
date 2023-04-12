require 'user'
require 'user_repository'

def reset_tables
  seed_sql = File.read('spec/seeds/chitter_seeds.sql')
  connection = PG.connect({ host: '127.0.0.1', dbname: 'chitter_test' })
  connection.exec(seed_sql)
end

describe UserRepository do
  before(:each) do
    reset_tables
  end

  it 'finds all users' do 
    repo = UserRepository.new

    user = repo.all
    expect(user.length).to eq(5)
    expect(user.first.email).to eq('mmoon@email.com')
    expect(user.last.full_name).to eq('Duggee Dog')
    expect(user.first.password).to eq('1234')
  end
  
  it 'finds all users by username' do 
    repo = UserRepository.new

    user = repo.all
    expect(user.length).to eq(5)
    expect(user.first.username).to eq('shinning_moon')
    expect(user.last.username).to eq('good_boy')
  end

  it 'creates a new user' do
    repo = UserRepository.new

    new_user = User.new
    new_user.full_name = 'Pedro Pascal'
    new_user.username = 'mandalorian'
    new_user.email = 'ppascal@email.com'
    new_user.password = 'grogu2'
    repo.create(new_user)

    user = repo.all

    expect(user.length).to eq(6)
    expect(user.last.full_name).to eq('Pedro Pascal')
    expect(user.last.username).to eq('mandalorian')
    expect(user.last.email).to eq('ppascal@email.com')
    expect(user.last.password).to eq('grogu2')
  end

end
