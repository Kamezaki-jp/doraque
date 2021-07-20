class Brave

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

# キーワード変数
brave = Brave.new(name: "テリー",hp: 500,offense: 150,defense: 100)

puts <<~TEXT
NAME: #{brave.getName}
HP: #{brave.getHp}
OFFENSE: #{brave.getOffense}
DEFENSE: #{brave.getDefense}
TEXT