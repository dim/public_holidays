require File.dirname(__FILE__) + '/england'

module PublicHolidays
  class NorthernIreland < England
    
    holidays %w(st_patrick orangemen)
    
    def st_patrick
      on('17 Mar').following(:working_day)
    end
  
    def orangemen
      on('12 Jul').following(:working_day)
    end
  
  end
end
