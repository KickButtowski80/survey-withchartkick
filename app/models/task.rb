class Task < ApplicationRecord
    def self.complete
        where(complete: true)
    end
    
    def self.in_complete
        where(complete: false)
    end
end
