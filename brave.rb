require './character'

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