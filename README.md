# warikan

金額, 人数を入力すると割り勘の金額が表示される

## Description

- Ruby
- pry

## purpuse

Ruby のみで簡単なアプリの作り方

## environment

- Ruby 2.6.5

## setup

```
$ echo "# warikan" >> README.md
$ git init
$ git add README.md
$ git commit -m "first commit"
$ git remote add origin https://github.com/karlley/warikan.git
$ git push -u origin master
```

## add Warikan class

warikan.rb

```
class Warikan
end
```

irb で読み込み

```
$ irb
>> require './warikan.rb'
true
>> warikan = Warikan.new
#<Warikan:0x00007fb0ec0ce1e0>
>> warikan.class
Warikan < Object
```

## overview

1. 全員男 or 全員女: 金額 / 人数
2. 男女混合: 男 70% / 人数, 女 30% / 人数
3. input: 金額, 男人数, 女人数 
4. output: 男一人当たり〇〇円, 女一人当たり〇〇円

https://qiita.com/nargok/items/bde2ded191842ae99608

## add base function

ベースとなる雛形

```
require "pry"

LINE = "--------------------------------------------------"

class Warikan
  WARIKAN = 1
  LOG = 2
  END_PROGRAM = 3 
end


def warikan(posts)
# 投稿
end

def log(posts)
# 一覧表示
end

posts = []

# メイン処理選択
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
    log(posts) 
  when Warikan::END_PROGRAM
    exit
  else
    puts "Wrong Number..."
  end
end
```

## add warikan function 

- 金額入力
- 割り勘金額出力

```
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
```

## add log function

- log の件数表示
- 詳細画面でlog_number 表示
- 番号選択を1 から始まるように修正 

```
def log(posts)
  # 投稿数表示
  posts_count = posts.count
  puts "There are #{posts_count} logs!"
  # 投稿番号,合計金額表示
  index = 1
  posts.each do |post|
    puts "[#{index}] #{post[:price]} 円"
    index += 1
  end

  puts "Select a number!"
  # index を1からスタートしてるので-1
  log_number = gets.chomp.to_i - 1
  # 表示する投稿を取得
  log = posts[log_number] 
  puts LINE
  puts "log_number [#{log_number + 1}]" 
  puts "飲み代: #{log[:price]} 円\n男性一人当たり: #{log[:male_price]} 円\n女性一人当たり: #{log[:female_price]} 円\n男性 : 女性 = 70 : 30"
puts LINE
end

# posts リセット
posts = []
```

## 足りない機能

- 番号以外の入力でのエラー
- 標準入力の数字を非表示
- 入力桁数でのエラー

## 全体のコード

```
require "pry"

LINE = "--------------------------------------------------"

class Warikan
  WARIKAN = 1
  LOG = 2
  END_PROGRAM = 3 
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
    puts LINE
    puts "男性: #{post[:male]}人 女性: #{post[:female]}人 飲み代: #{post[:price]} 円"
    puts "WARIKAN!!"
    if post[:male] == 0
      puts "女性一人当たり: #{post[:female_price]} 円\n"
    elsif post[:female] == 0
      puts "男性一人当たり: #{post[:male_price]} 円\n"
    else
      puts "男性一人当たり: #{post[:male_price]} 円\n女性一人当たり: #{post[:female_price]} 円\n男性 : 女性 = 70 : 30"
    end
    puts LINE
    puts "\n"
  end

end


def log(posts)
  # 投稿数表示
  posts_count = posts.count
  puts "There are #{posts_count} logs!"
  # 投稿番号,合計金額表示
  index = 1
  posts.each do |post|
    puts "[#{index}] #{post[:price]} 円"
    index += 1
  end

  puts "Select a number!"
  # index を1からスタートしてるので-1
  log_number = gets.chomp.to_i - 1
  # 表示する投稿を取得
  log = posts[log_number] 
  puts LINE
  puts "log_number [#{log_number + 1}]" 
  puts "飲み代: #{log[:price]} 円\n男性一人当たり: #{log[:male_price]} 円\n女性一人当たり: #{log[:female_price]} 円\n男性 : 女性 = 70 : 30"
puts LINE
end

# posts リセット
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
    log(posts) 
  when Warikan::END_PROGRAM
    exit
  else
    puts "Wrong Number..."
  end
end
```
