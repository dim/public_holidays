require File.dirname(__FILE__) + '/abstract'

module PublicHolidays
  module Christian
    
    def easter_sunday
      a = year % 19
      b = year / 100
      c = year % 100
      d = b / 4
      e = b % 4
      f = c / 4
      g = c % 4
  
      h = (b + 8) / 25
      i = (b - h + 1) / 3
      j = (19*a + b - d - i + 15) % 30
      k = (32 + 2*e + 2 * f - j - g) % 7
      m = (a + 11*j + 22*k) / 451
      n = j + k - 7*m + 114
  
      Date.civil(year, n / 31, (n % 31) + 1)        
    end
    
    def epiphany
      on('6 Jan')
    end
    
    def easter_monday
      easter_sunday + 1
    end
    
    def good_friday
      easter_sunday - 2
    end
    
    def maundy_thursday
      easter_sunday - 3    
    end
  
    def ascension
      (easter_sunday + 39).following(:thursday)
    end
  
    def whit_monday
      (easter_sunday + 50).following(:monday)
    end
    
    def christmas
      on('25 Dec')
    end
  
    def boxing_day
      on('26 Dec')
    end
    
    def corpus_christi
      (easter_sunday + 56).following(:thursday)
    end
  
    def assumption
      on('15 Aug')      
    end
      
    def all_saints
      on('1 Nov')      
    end
    
    def repentance
      on('23 Nov').previous(:wednesday)
    end
  
    def immaculate_conception
      on('8 Dec')
    end
  
    def reformation
      on('31 Oct')
    end
      
  end
end
