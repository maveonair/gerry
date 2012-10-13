require 'spec_helper'

describe '.account_capabilities' do    
  it 'should fetch all account capabilities' do
    stub = stub_get('/accounts/self/capabilities', 'capabilities.json')                     
    
    client = MockGerry.new
    capabilities = client.account_capabilities
    stub.should have_been_requested
    
    capabilities['queryLimit']['min'].should eql(0)
    capabilities['queryLimit']['max'].should eql(500)    
  end
  
  it 'should fetch some account capabilities' do
    stub = stub_get('/accounts/self/capabilities?q=createAccount&q=createGroup', 'query_capabilities.json')                     
    
    client = MockGerry.new
    capabilities = client.account_capabilities(['q=createAccount', 'q=createGroup'])
    stub.should have_been_requested
    
    capabilities['createAccount'].should eql(true)
    capabilities['createGroup'].should eql(true)    
  end
end