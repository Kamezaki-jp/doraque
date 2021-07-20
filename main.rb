require './brave'
require './monster'

# ハッシュとして送信
brave = Brave.new(name: "テリー",hp: 500,offense: 150,defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

# loop do で無限に繰り返す
loop do
  brave.attack(monster)
  break if monster.hp <= 0

  monster.attack(brave)
  break if brave.hp <= 0
end

battle_result = brave.hp > 0

if battle_result
  exp = (monster.offense + monster.defense) * 2
  gold = (monster.offense + monster.defense) * 3
  puts "#{brave.name}は戦いに勝利した！"
  puts "#{exp}の経験値と#{gold}ゴールドを獲得した！"
else
  puts "#{brave.name}は戦いに敗北した。。。"
  puts "目の前が真っ暗になった。。。"
end

