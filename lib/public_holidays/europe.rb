require File.dirname(__FILE__) + '/western'

module PublicHolidays
  module Europe
    include Western
    
    def labour_day
      on('1 May')
    end
      
  end
end
