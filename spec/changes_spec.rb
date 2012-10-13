require 'spec_helper'

describe '.changes' do    
  it 'should fetch all changes' do
    stub = stub_get('/changes/', 'changes.json')                     
    
    client = MockGerry.new
    changes = client.changes
    
    stub.should have_been_requested
    
    changes[0]['project'].should eql('awesome')
    changes[0]['branch'].should eql('master')
    
    changes[1]['project'].should eql('clean')
    changes[1]['subject'].should eql('Refactor code')
    changes[1]['owner']['name'].should eql('Batman')
  end
  
  it 'should fetch all open changes' do
    
    stub = stub_get('/changes/?q=is:open+owner:self', 'open_changes.json')                     
    
    client = MockGerry.new
    changes = client.changes(['q=is:open+owner:self'])
    
    stub.should have_been_requested
    
    changes[0]['status'].should eql('OPEN')
    changes[0]['owner']['name'].should eql('The Duke')
  end
end