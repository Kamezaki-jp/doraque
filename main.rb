class Brave
  # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  # initializeメソッド
  # インスタンス作成時に初期値を設定する。
  # paramsで一括で受け取る
  # 引数に**を記述：ハッシュしか受け取れなくなる
  def initialize(**params)
    # 各パラメータをハッシュで取得
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
  
end

class Monster
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]
  end
end

# ハッシュとして送信
brave = Brave.new(name: "テリー",hp: 500,offense: 150,defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

puts <<~TEXT
NAME: #{brave.name}
HP: #{brave.hp}
OFFENSE: #{brave.offense}
DEFENSE: #{brave.defense}
TEXT

brave.hp -= 30

puts "#{brave.name}はダメージを受けた。残りのHPは#{brave.hp}だ"