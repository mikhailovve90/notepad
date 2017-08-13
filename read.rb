require_relative 'lib/post'
require_relative 'lib/memo'
require_relative 'lib/link'
require_relative 'lib/task'
require 'optparse'

options = {}

OptionParser.new do |opt|
  opt.banner = 'Usage: read.rb [options]'

  opt.on('-h', 'Print this help') do
    puts opt
    exit
  end

  opt.on('--type POST_TYPE', 'какой тип постов(по умолчанию любой)') { |o| options[:type] = o}
  opt.on('--id POST_ID', 'если задан id показываем только этот пост') { |o| options[:id] = o}
  opt.on('--limit NUMBER', 'сколько постов (по умолчанию все)') { |o| options[:limit] = o}

end.parse!

result = Post.find(options[:limit], options[:type], options[:id])

if result.is_a? Post
  puts "Запись #{result.class.name}, id = #{options[:id]}"

  result.to_strings.each do |line|
    puts line
  end
else
  print "| id\t @type\t| @created_at\t\t\t| @text \t\t\t| @url\t\t @due_date \t "

  result.each do |row|
    puts

    row.each do |element|
      print "| #{element.to_s.delete("\\n\\r")[0..40]}\t"
    end
  end
end

puts


