require File.dirname(__FILE__) + '/christian'
require File.dirname(__FILE__) + '/europe'

module PublicHolidays
  class Germany < Abstract
    include Christian
    include Europe
  
    holidays %w(
      new_year epiphany good_friday easter_monday labour_day 
      ascension whit_monday corpus_christi assumption 
      german_unity reformation all_saints 
      repentance christmas boxing_day
    )

    def german_unity
      on('3 Oct')
    end
    
  end
end
