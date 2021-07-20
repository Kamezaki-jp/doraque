class Character
  attr_reader :offense, :defense
  attr_accessor :name, :hp
  
  def initialize(**params)
    @name = params[:name]
    @hp = parmas[:hp]
    @offence = params[:offence]
    @defense = params[:defense]
  end
end

class Brave < Character

  SPECIAL_ATTACK_CONSTANT = 1.5

  # 攻撃メソッド
  def attack(monster)
    puts "#{@name}の攻撃！"

    # decision_attack_typeメソッドの呼び出し
    attack_type = decision_attack_type
    # calculate_damageメソッドの呼び出し
    damage = calculate_damage(target: monster,attack_type: attack_type)
    # ダメージをHPに反映させる
    cause_damage(target: monster,damage: damage)
    
    puts "#{monster.name}の残りHPは、#{monster.hp.floor}だ！"
  end
  

  private
    # 通常攻撃かクリティカルヒットか判定をするメソッド
    def decision_attack_type
      attack_num = rand(4)
      
      if attack_num == 0
        puts "クリティカルヒット！"
        "special_attack"
      else
        puts "通常攻撃"
        "normal_attack"
      end
    end
    
    # ダメージ計算のメソッド
    def calculate_damage(**params)
      # 変数に格納することによって将来ハッシュのキーに変更があった場合でも変更箇所が少なくて済む
      target = params[:target]
      attack_type = params[:attack_type]

      if attack_type == "special_attack"
        calculate_special_attack - target.defense
      else
        @offense - target.defense
      end
    end

    # ダメージ反映させる
    def cause_damage(**params)

      target = params[:target]
      damage = params[:damage]

      target.hp -= damage
      # もしターゲットのHPがマイナスになるなら0を代入
      target.hp = 0 if target.hp < 0

      puts "#{target.name}は#{damage.floor}のダメージを受けた！"
    end
    
    def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONSTANT
    end
    
end

class Monster < Character

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offence: params[:offence],
      defense: parmas[:defense]
    )
    
    @transform_hp = params[:hp] * CALC_HALF_HP
    @transform_flag = false
  end

  def attack(brave)
    # HPが半分かつ変身していないとき
    if @hp <= @transform_hp && @transform_flag == false
      @transform_flag = true
      transform
    end

      puts "#{@name}の攻撃！"

      # ダメージの計算メソッドを呼び出し
      damage = calculate_damage(brave)
      
      # ダメージの反映メソッドを呼び出し
      cause_damage(target: brave, damage: damage)

      puts "#{brave.name}の残りHPは#{brave.hp.floor}だ！"
  end

  private
    def transform

      transform_name = "ドラゴン"

      puts "#{@name}は怒っている"
      puts "#{@name}は#{transform_name}に変身した！"
      
      @offense *= POWER_UP_RATE
      @name = transform_name
    end

    # ダメージ計算のメソッド
    def calculate_damage(target)
      @offense - target.defense
    end

    def cause_damage(**params)
      target = params[:target]
      damage = params[:damage]

      target.hp -= damage

      # もしターゲットのHPがマイナスになるなら0を代入
      target.hp = 0 if target.hp < 0

      puts "#{target.name}は#{damage.floor}のダメージを受けた！"
    end
  
end



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

