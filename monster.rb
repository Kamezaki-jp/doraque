require './character'

class Monster < Character

  POWER_UP_RATE = 1.5
  CALC_HALF_HP = 0.5

  def initialize(**params)
    super(
      name: params[:name],
      hp: params[:hp],
      offense: params[:offense],
      defense: params[:defense]
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