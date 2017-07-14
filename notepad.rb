require_relative "lib/link"
require_relative "lib/memo"
require_relative "lib/task"
require_relative "lib/post"

puts "Это блокнот"
puts "Что хотите записать в блокнот?"

choices = Post.post_types

choice = -1

until choice >= 0 && choice < choice.size
  choices.each_with_index {|type, index| puts "\t#{index}. #{type}"}

  choice = STDIN.gets.to_i
end

entry = Post.create(choice)
entry.read_from_console
entry.save

puts "Запись сохранена"