require File.dirname(__FILE__) + '/abstract'

module PublicHolidays
  module Western
    
    def new_year
      civil(1, 1)    
    end

  end
end