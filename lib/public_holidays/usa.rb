require File.dirname(__FILE__) + '/christian'
require File.dirname(__FILE__) + '/western'

module PublicHolidays
  class USA < Abstract
    include Christian
    include Western
    
    holidays %w(
      new_year martin_luther_king george_washington
      memorial_day independence_day labor_day 
      columbus_day veterans_day thanks_giving 
      christmas
    )
    
    extra_dates civil(2009, 1, 20), civil(2005, 1, 20), civil(2001, 1, 20), 
                civil(1997, 1, 20), civil(1993, 1, 20), civil(1989, 1, 20), 
                civil(1985, 1, 20), civil(1981, 1, 20), civil(1977, 1, 20), 
                civil(1974, 8, 4),  civil(1973, 1, 20)
    
    def martin_luther_king
      on('15 Jan').following(:monday)    
    end
  
    def george_washington
      on('15 Feb').following(:monday) 
    end
  
    def memorial_day
      on('31 May').previous(:monday)
    end
    
    def independence_day
      on('4 Jul').closest_working_day
    end
    
    def new_year
      super.closest_working_day
    end
  
    def christmas
      super.closest_working_day
    end    
  
    def labor_day
      on('1 Sep').following(:monday)    
    end
  
    def columbus_day
      on('8 Oct').following(:monday)
    end
  
    def veterans_day
      on('11 Nov').closest_working_day    
    end
  
    def thanks_giving
      on('22 Nov').following(:thursday)
    end
          
  end
end
