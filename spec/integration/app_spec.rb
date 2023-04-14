require 'spec_helper'
require 'rack/test'
require_relative '../../app'

describe Application do

    include Rack::Test::Methods

    let(:app) {Application.new}

    context 'GET /' do
        it 'should display the welcome page' do
            response = get('/')

            expect(response.status).to eq(200)
            # expect(response.body).to include()
            end
        end

#  context 'GET /peeps'
#  it 'returns a list of all peeps in descending order, from newest to oldest peep' do
#     response = get('/peeps')

#     expect(response.status).to eq(200)
#     expect(response.body).to include('Have you seen Schitts Creek?')
#     expect(response.body).to include('MEOOOOOOOW')
#     expect(response.body).to include('Such a lovely evening.')
#     expect(response.body).to include('woof woof ... aaaaaaah woof')
#     expect(response.body).to include('Going to the seaside next week - looking forward to it!')
#  end

    end
