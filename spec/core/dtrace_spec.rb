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
        expect(provider.postgres__connect).to be_a(USDT::Probe)
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
