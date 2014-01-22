require File.join(File.dirname(File.expand_path(__FILE__)), "spec_helper")

describe Sequel::DTrace do
  describe 'initialize' do
    it 'creates a new provider' do
      USDT::Provider.should_receive(:create).once.with(:ruby, :sequel)
      Sequel::DTrace::Provider.new
    end
  end

  describe 'probes' do
    let(:provider) { Sequel::DTrace::Provider.new }

    describe 'postgres__connect' do
      it 'is a probe' do
        provider.postgres__connect.should be_a(USDT::Probe)
      end

      it 'has :postgres function' do
        provider.postgres__connect.function.should == :postgres
      end

      it 'has :connect name' do
        provider.postgres__connect.name.should == :connect
      end

      it 'takes a string argument' do
        provider.postgres__connect.arguments.should == [:string]
      end
    end
  end

  describe '::provider' do
    it 'returns a DTraceProvider' do
      provider = Sequel::DTrace.provider
      expect(provider).to be_a(Sequel::DTrace::Provider)
    end
  end
end
