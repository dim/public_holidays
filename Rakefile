require 'rake'

PH_ROOT = File.dirname(__FILE__) 

task :default => :create

desc 'Create new definitions'
task :create do
  range = parse_range
  each_source do |klass, name|
    path = File.expand_path(PH_ROOT + "/db/#{name}.yml")
    
    puts "Writing #{path}"
    File.open(path, 'w') do |file|
      file << klass.create(range).to_yaml
    end  
  end
end

desc 'List holidays (add COUNTRY env-variable, Example: COUNTRY=england)'
task :list do
  raise "No COUNTRY variable given" unless ENV['COUNTRY']
  range = parse_range
    
  each_source do |klass, name|  
    next unless name == ENV['COUNTRY'].to_s.downcase
      
    path = File.expand_path(PH_ROOT + "/db/#{name}.yml")
    klass.create(range).each do |date|
      puts date.strftime('%a, %d %b %Y')
    end
  end
end


def each_source(&block)
  Dir[PH_ROOT + '/lib/public_holidays/*.rb'].sort.each do |file|
    require file
    name  = File.basename(file, '.rb')
    
    klass_name = name.gsub(/(?:^|_)(.)/) { $1.upcase }  
    klass = if PublicHolidays.const_defined?(klass_name.to_sym)
      PublicHolidays.const_get(klass_name.to_sym)
    elsif PublicHolidays.const_defined?(klass_name.upcase.to_sym)
      PublicHolidays.const_get(klass_name.upcase.to_sym)
    else
      nil
    end
    next unless klass < PublicHolidays::Abstract
    
    yield(klass, name)
  end  
end

def parse_range
  range = eval(ENV['RANGE'].to_s) rescue nil
  range.is_a?(Range) ? range : (1970..2030)
end

