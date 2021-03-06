Sequel.require 'adapters/shared/informix'

module Sequel
  module JDBC
    # Database and Dataset instance methods for Informix specific
    # support via JDBC.
    module Informix
      # Database instance methods for Informix databases accessed via JDBC.
      module DatabaseMethods
        extend Sequel::Database::ResetIdentifierMangling
        include Sequel::Informix::DatabaseMethods
        
        private
        
        # TODO: implement
        def last_insert_id(conn, opts=OPTS)
          nil
        end
      end
    end
  end
end
