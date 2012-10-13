require 'spec_helper'

describe '.map_options' do    
  it 'should map the query options' do                  
    
    client = MockGerry.new
    options = client.map_options(['q=createAccount', 'q=createGroup'])
    
    options.should eql('q=createAccount&q=createGroup')    
  end
end

describe '.get' do
  it 'should request projects as anoymous' do
    stub = stub_get('/projects/', 'projects.json')                       
    
    client = MockGerry.new
    client.projects
       
    stub.should have_been_requested
  end
  
  it 'should request projects as user' do
    username = 'gerry'
    password = 'whoop'
    
    body = get_fixture('projects.json')
    stub = stub_request(:get, "http://#{username}:#{password}@localhost/a/projects/").to_return(:status => 200, :body => "#{body}", :headers => {'Content-Type' => 'application/json'})                      
    
    client = Gerry.new(MockGerry::URL, 'gerry', 'whoop')
    projects = client.projects
       
    stub.should have_been_requested
    
    projects['awesome']['description'].should eql('Awesome project')
    projects['clean']['description'].should eql('Clean code!')
  end
end