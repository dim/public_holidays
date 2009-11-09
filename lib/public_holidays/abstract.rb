require 'rubygems'
require 'date'
require 'yaml'

class Date
  
  def following(cwday)
    range = parse_cwday_range(cwday)
    date = self
    date += 1 until range.include?(date.cwday) 
    date    
  end

  def previous(cwday)
    range = parse_cwday_range(cwday)
    date = self
    date -= 1 until range.include?(date.cwday) 
    date    
  end
  
  def after(other)
    date = self
    date += 1 until date > other 
    date
  end
  
  def closest_working_day
    case cwday
    when 6
      previous(:friday)
    when 7
      following(:monday)
    else
      self.dup
    end
  end
  
  protected

    CWDAY_CODES = Hash.new(0)
    CWDAY_CODES.update(
      'monday' => 1,
      'tuesday' => 2,
      'wednesday' => 3,
      'thursday' => 4,
      'friday' => 5,
      'saturday' => 6,
      'sunday' => 7,
      'working_day' => [1,2,3,4,5]
    )
  
    def parse_cwday_range(cwday)
      case cwday
      when String, Symbol
        Array(CWDAY_CODES[cwday.to_s.downcase])
      else
        Array(cwday)
      end
    end
  
end

module PublicHolidays
  class Abstract
    attr_reader :year
    
    def self.holidays(*names)
      @holidays ||= []
      @holidays += names.flatten unless names.empty?
      @holidays
    end
  
    def self.extra_dates(*dates)
      @extra_dates ||= []
      @extra_dates += dates.flatten unless dates.empty?
      @extra_dates
    end
    
    def self.civil(*args)
      Date.civil(*args)
    end
    
    def self.create(range)      
      range.map do |year|                 
        year = new(year)
        holidays.map do |name|
          year.__send__(name.to_sym)
        end + year.extra_dates 
      end.flatten.sort
    end
  
    def initialize(year)
      @year = year
    end
    
    def extra_dates
      self.class.extra_dates.select {|i| i.year == self.year }
    end
        
    protected
      
      def on(day_and_month)
        Date.parse "#{day_and_month} #{year}"
      end
      
      def civil(month, day)
        self.class.civil year, month, day
      end
  
  end
end
