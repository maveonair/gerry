require 'spec_helper'

describe '.projects' do    
  it 'should fetch all projects' do
    stub = stub_get('/projects/', 'projects.json')                     
    
    client = MockGerry.new
    projects = client.projects
    
    stub.should have_been_requested
    
    projects['awesome']['description'].should eql('Awesome project')
    projects['clean']['description'].should eql('Clean code!')
  end
  
  it 'should fetch a project' do
    stub = stub_get('/projects/awesome', 'projects.json')                     
    
    client = MockGerry.new
    projects = client.find_project('awesome')
    
    stub.should have_been_requested
    
    projects['awesome']['description'].should eql('Awesome project')
  end
end