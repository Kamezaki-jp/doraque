class Brave
  # attr_readerの記述でゲッターを省略することができる
  attr_reader :name, :offense, :defense
  attr_accessor :hp

  SPECIAL_ATTACK_CONSTANT = 1.5

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

      puts "#{target.name}は#{damage}のダメージを受けた！"
    end
    
    def calculate_special_attack
      @offense * SPECIAL_ATTACK_CONSTANT
    end
    
end

class Monster
  attr_reader :offense, :defense
  attr_accessor :hp, :name

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    @name = params[:name]
    @hp = params[:hp]
    @offense = params[:offense]
    @defense = params[:defense]

    @transform_hp = params[:hp] * CALC_HALF_HP
    @transform_flag = false
  end

  def attack(brave)
    # HPが半分かつ返信していないとき
    if @hp <= @transform_hp && @transform_flag == false
      @transform_flag = true
      transform
    end

      puts "#{@name}の攻撃！"

      damage = @offense - brave.defense
      brave.hp -= damage
      
      puts "#{brave.name}は#{damage.floor}のダメージを受けた！"
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
  
end



# ハッシュとして送信
brave = Brave.new(name: "テリー",hp: 500,offense: 150,defense: 100)
monster = Monster.new(name: "スライム", hp: 250, offense: 200, defense: 100)

brave.attack(monster)
monster.attack(brave)
