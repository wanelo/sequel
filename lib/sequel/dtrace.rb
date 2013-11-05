require 'usdt'

module Sequel
  module DTrace
    class << self
      def provider
        @provider ||= Provider.new.tap do |p|
          p.postgres__connect
          p.provider.enable
        end
      end
    end

    class Provider
      attr_reader :provider

      def initialize
        @provider ||= USDT::Provider.create(:ruby, :sequel)
      end

      def postgres__connect
        @postgres__connect ||= provider.probe(:postgres, :connect, :string)
      end
    end
  end
end
