require 'spec_helper'
require 'shared/connection_examples'


describe 'Zookeeper' do
  let(:path) { "/_zktest_" }
  let(:data) { "underpants" } 
  let(:connection_string) { Zookeeper.default_cnx_str }

  before do
    @zk = Zookeeper.new(connection_string)
  end

  after do
    @zk and @zk.close
  end

  def zk
    @zk
  end

  it_should_behave_like "connection"

#   describe %[reopen on timed out session], :long_running => true do
#     it %[should successfully create a new session] do
#       logger.debug { "pausing for 10s" }
#       @zk.pause

#       sleep(10.05)
#       logger.debug { "session should now be expired" }

#       @zk.resume

#       lambda { @zk.get(:path => path) }.should raise_error(Zookeeper::Exceptions::SessionExpired)
#     end
#   end
end

