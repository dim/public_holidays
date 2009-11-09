require File.dirname(__FILE__) + '/christian'
require File.dirname(__FILE__) + '/europe'

module PublicHolidays
  class England < Abstract
    include Christian
    include Europe

    holidays %w(
      new_year good_friday easter_monday early_may 
      spring summer christmas boxing_day
    )    
    extra_dates civil(1982, 7, 29), civil(1999, 12, 31), civil(2002, 6, 4)
  
    def early_may
      labour_day.following(:monday)
    end
  
    def spring
      on('31 May').previous(:monday)
    end
  
    def summer
      on('31 Aug').previous(:monday)
    end
  
    def christmas
      super.following(:working_day)    
    end
  
    def new_year
      super.following(:working_day)    
    end
  
    def boxing_day
      super.following(:working_day).after(christmas)
    end
          
  end
end
