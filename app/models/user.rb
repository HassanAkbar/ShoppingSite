class User < ActiveRecord::Base
    self.inheritance_column = :type

    def self.types
      %w(Customer Admin)
    end

end


