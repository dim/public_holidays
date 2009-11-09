require File.dirname(__FILE__) + '/england'

module PublicHolidays
  class Scotland < England
  
    holidays %w(jan_2nd st_andrew)
    
    def jan_2nd
      on('2 Jan').following(:working_day).after(new_year)
    end
    
    def st_andrew
      on('30 Nov').following(:working_day)
    end  
  
  end
end

