class Brave

  # initializeメソッド
  # インスタンス作成時に初期値を設定する。
  def initialize
    @name = "テリー"
    @hp = 500
    @offense = 150
    @defense = 100
  end
  
  # name getter
  def getName
    @name
  end

  # hp getter
  def getHp
    @hp
  end
  
  # offense getter
  def getOffense
    @offense
  end
  
  # defense getter
  def getDefense
    @defense
  end
  
end

brave = Brave.new

puts <<~TEXT
NAME: #{brave.getName}
HP: #{brave.getHp}
OFFENSE: #{brave.getOffense}
DEFENSE: #{brave.getDefense}
TEXT