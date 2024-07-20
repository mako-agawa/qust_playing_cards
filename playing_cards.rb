# omni_deckのデータを読みんこみ
require './omni_deck'

# プレイヤークラスでセットアップ
class Player
  attr_accessor :name, :deck, :score

  def initialize(name)
    @name = name
    @deck = []
    @score = 0
  end
end
# 勝者に対してスコアを加算

player1 = Player.new('たろう')
player2 = Player.new('じろう')
# プレイヤーを配列にする
players = [player1, player2]

# n人にカードを配る処理
n = 2
(omni_deck.length / n).times do
  r = rand(omni_deck.length)
  player1.deck << omni_deck[r]
  omni_deck.delete("#{omni_deck[r]}")

  r = rand(omni_deck.length)
  player2.deck << omni_deck[r]
  omni_deck.delete("#{omni_deck[r]}")
end

def battle_cards(players)
  puts '戦争！'
  @result_array = []
  players.map do |player|
    # 自分の手札から一枚カードをドローする乱数dを定義
    d = rand(player.deck.length)
    puts "#{player.name}のカードは#{player.deck[d][:mark]}の#{player.deck[d][:number]}です。"

    card_power = [player.name, player.deck[d][:power]]
    player.deck.delete_at(d)
    @result_array << card_power
  end
  # 最大値を見つけ、# 最大値を持つサブ配列をすべて見つける
  max_value = @result_array.map { |sub_array| sub_array[1] }.max
  winner_array = @result_array.select { |sub_array| sub_array[1] == max_value }
  puts '=================='
  if winner_array.length == 1
    @winner_name = winner_array[0][0]
    puts "#{@winner_name}が勝ちました。"
    puts '戦争を終了します'
  else
    puts '引き分け'
    battle_cards(players)
  end
end

battle_cards(players)
