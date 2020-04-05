# warikan

金額, 人数を入力すると割り勘の金額が表示される

## purpuse

Ruby のclass, module の理解を深める

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

## add function 

- warikan クラスで入力からは配列を作るところまでok
- class, module が使えてない

https://qiita.com/nargok/items/bde2ded191842ae99608