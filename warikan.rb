require "pry"

LINE = "--------------------------------------------------"

class Warikan
  WARIKAN = 0
  LOG = 1
  END_PROGRAM = 2
end


def warikan(posts)
  post = {}

  puts "How many male?"
  post[:male] = gets.chomp.to_i

  puts "How many female?"
  post[:female] = gets.chomp.to_i

  puts "What's the total price?"
  post[:price] = gets.chomp.to_i

  if post[:male] == 0  
    post[:female_price] = (post[:price] / post[:female]).ceil
  elsif post[:female] == 0
    post[:male_price] = (post[:price] / post[:male]).ceil
  else
    post[:male_price] = (post[:price] * 0.7 / post[:male]).ceil
    post[:female_price] = (post[:price] * 0.3 / post[:female]).ceil
  end

  posts << post

  posts.each do |post|
    puts "\n"
    puts "#{LINE}"
    puts "男性: #{post[:male]}人 女性: #{post[:female]}人 飲み代: #{post[:price]} 円"
    puts "WARIKAN!!"
    if post[:male] == 0
      puts "女性一人当たり: #{post[:female_price]} 円\n"
    elsif post[:female] == 0
      puts "男性一人当たり: #{post[:male_price]} 円\n"
    else
      puts "男性一人当たり: #{post[:male_price]} 円\n女性一人当たり: #{post[:female_price]} 円\n男性 : 女性 = 70 : 30"
    end
    puts "#{LINE}"
    puts "\n"
  end

end


def log(posts)
  puts "#{posts[:male]}"
  puts "#{posts[:female]}"
  puts "#{posts[:price]}"
end

posts = []

while true do
  puts "What do you want to do? Please select a number!"
  puts "[#{Warikan::WARIKAN}] Start Warikan!"
  puts "[#{Warikan::LOG}] Show Warikan Logs!"
  puts "[#{Warikan::END_PROGRAM}] Bye!\n#{LINE}"

  operation = gets.chomp.to_i

  case operation
  when Warikan::WARIKAN
    warikan(posts) 
  when Warikan::LOG
    # log
  when Warikan::END_PROGRAM
    exit
  else
    puts "Wrong Number..."
  end
end
