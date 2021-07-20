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

  def attack(monster)
    puts "#{@name}の攻撃！"

    attack_num = rand(4)
    if attack_num == 0
      puts "クリティカルヒット！"
      damage = calculate_special_attack - monster.defense
    else
      puts "通常攻撃"
      damage = @offense - monster.defense
    end

    monster.hp -= damage

    puts "#{monster.name}は#{damage.floor}のダメージを受けた！"
    puts "#{monster.name}の残りHPは、#{monster.hp.floor}だ！"

  end

  def calculate_special_attack
    @offense * 1.5
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

brave.attack(monster)
