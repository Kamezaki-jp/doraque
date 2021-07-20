class Brave
  #nameのセッター
  def name=(name)
    @name = name
  end

  # name getter
  def getName
    @name
  end

  # HPのセッター
  def hp=(hp)
    @hp = hp
  end

  # hp getter
  def getHp
    @hp
  end

  # Offenseのセッター
  def offense=(offense)
    @offense = offense
  end

  # offense getter
  def getOffense
    @offense
  end

  # defenseのセッター
  def defense=(defense)
    @defense = defense
  end

  # defense getter
  def getDefense
    @defense
  end
  
end

brave = Brave.new
brave.name = "テリー"
brave.hp = 500
brave.offense = 150
brave.defense = 100

puts <<~TEXT
NAME: #{brave.getName}
HP: #{brave.getHp}
OFFENSE: #{brave.getOffense}
DEFENSE: #{brave.getDefense}
TEXT