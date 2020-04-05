LINE = "\n----------"

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

  puts "What's the total?(Enter with numbers)"
  post[:price] = gets.chomp.to_i

  # if post[:price].class == Integer
  #   puts "Enter with number!"
  #   return
  # end

  if post[:male] == 0  
    post[:female_price] = post[:price] / post[:female]
  elsif post[:female] == 0
    post[:male_price] = post[:price] / post[:male]
  else
    post[:male_price] = post[:price] * 0.7 / post[:male]
    post[:female_price] = post[:price] * 0.3 / post[:female]
  end

  posts << post

  posts.each do |post|
    puts "#{LINE}"
    puts "\n"
    puts "男性が#{post[:male]}人, 女性が#{post[:female]}人"
    puts "#{post[:price]}円の割り勘金額は"
    puts "男性一人当たり#{post[:male_price]}円\n女性一人当たり#{post[:female_price]}円 です！"
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
  puts "What do you want to do?"
  puts "[#{Warikan::WARIKAN}] Start Warikan!"
  puts "[#{Warikan::LOG}] Show Warikan Logs!"
  puts "[#{Warikan::END_PROGRAM}] Bye!\n#{LINE}"

  operation = gets.chomp.to_i

  case operation
  when Warikan::WARIKAN
    warikan(posts) # 情報入力
  when Warikan::LOG
    # log
  when Warikan::END_PROGRAM
    exit
  else
    puts "Wrong Number..."
  end
end
