require File.dirname(__FILE__) + '/christian'
require File.dirname(__FILE__) + '/europe'

module PublicHolidays
  class France < Abstract
    include Christian
    include Europe

    holidays %w(
      new_year good_friday easter_monday labour_day victory_day
      ascension whit_monday bastille_day assumption all_saints 
      armistice_day christmas boxing_day
    )
  
    def victory_day
      on('8 May')
    end
    
    def bastille_day
      on('14 Jul')
    end
  
    def armistice_day
      on('11 Nov')
    end  
    
  end
end
