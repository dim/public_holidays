require File.dirname(__FILE__) + '/christian'
require File.dirname(__FILE__) + '/europe'

module PublicHolidays
  class Italy < Abstract
    include Christian
    include Europe
  
    holidays %w(
      new_year epiphany good_friday easter_monday liberation labour_day 
      republic_anniversary assumption all_saints 
      immaculate_conception christmas boxing_day
    )

    def liberation
      on('25 Apr')
    end
    
    def republic_anniversary
      on('2 Jun')
    end
    
  end
end
