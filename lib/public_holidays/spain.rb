require File.dirname(__FILE__) + '/christian'
require File.dirname(__FILE__) + '/europe'

module PublicHolidays
  class Spain < Abstract
    include Christian
    include Europe

    holidays %w(
      new_year epiphany san_jose maundy_thursday good_friday 
      labour_day assumption national_day all_saints constitution
      immaculate_conception christmas
    )
  
    def san_jose
      on('19 Mar')
    end
    
    def national_day
      on('12 Oct')
    end
    
    def constitution
      on('6 Dec')
    end  

  end
end
