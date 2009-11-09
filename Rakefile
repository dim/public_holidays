require 'rake'

PH_ROOT = File.dirname(__FILE__) 

task :default => :create

desc 'Create new definitions'
task :create do
  range = (1970..2030)
  
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
    
    path = File.expand_path(PH_ROOT + "/db/#{name}.yml")
    
    puts "Writing #{path}"
    File.open(path, 'w') do |file|
      file << klass.create(range).to_yaml
    end
  end
end
