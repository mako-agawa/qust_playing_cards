# 全てのトランプの山の配列
omni_deck = [
  { mark: 'ハート', number: 1, power: 13 },
  { mark: 'ハート', number: 13, power: 12 },
  { mark: 'ハート', number: 12, power: 11 },
  { mark: 'ハート', number: 11, power: 10 },
  { mark: 'ハート', number: 10, power: 9 },
  { mark: 'ハート', number: 9, power: 8 },
  { mark: 'ハート', number: 8, power: 7 },
  { mark: 'ハート', number: 7, power: 6 },
  { mark: 'ハート', number: 6, power: 5 },
  { mark: 'ハート', number: 5, power: 4 },
  { mark: 'ハート', number: 4, power: 3 },
  { mark: 'ハート', number: 3, power: 2 },
  { mark: 'ハート', number: 2, power: 1 },
  { mark: 'ダイヤ', number: 1, power: 13 },
  { mark: 'ダイヤ', number: 13, power: 12 },
  { mark: 'ダイヤ', number: 12, power: 11 },
  { mark: 'ダイヤ', number: 11, power: 10 },
  { mark: 'ダイヤ', number: 10, power: 9 },
  { mark: 'ダイヤ', number: 9, power: 8 },
  { mark: 'ダイヤ', number: 8, power: 7 },
  { mark: 'ダイヤ', number: 7, power: 6 },
  { mark: 'ダイヤ', number: 6, power: 5 },
  { mark: 'ダイヤ', number: 5, power: 4 },
  { mark: 'ダイヤ', number: 4, power: 3 },
  { mark: 'ダイヤ', number: 3, power: 2 },
  { mark: 'ダイヤ', number: 2, power: 1 },
  { mark: 'スペード', number: 1, power: 13 },
  { mark: 'スペード', number: 13, power: 12 },
  { mark: 'スペード', number: 12, power: 11 },
  { mark: 'スペード', number: 11, power: 10 },
  { mark: 'スペード', number: 10, power: 9 },
  { mark: 'スペード', number: 9, power: 8 },
  { mark: 'スペード', number: 8, power: 7 },
  { mark: 'スペード', number: 7, power: 6 },
  { mark: 'スペード', number: 6, power: 5 },
  { mark: 'スペード', number: 5, power: 4 },
  { mark: 'スペード', number: 4, power: 3 },
  { mark: 'スペード', number: 3, power: 2 },
  { mark: 'スペード', number: 2, power: 1 },
  { mark: 'クラブ', number: 1, power: 13 },
  { mark: 'クラブ', number: 13, power: 12 },
  { mark: 'クラブ', number: 12, power: 11 },
  { mark: 'クラブ', number: 11, power: 10 },
  { mark: 'クラブ', number: 10, power: 9 },
  { mark: 'クラブ', number: 9, power: 8 },
  { mark: 'クラブ', number: 8, power: 7 },
  { mark: 'クラブ', number: 7, power: 6 },
  { mark: 'クラブ', number: 6, power: 5 },
  { mark: 'クラブ', number: 5, power: 4 },
  { mark: 'クラブ', number: 4, power: 3 },
  { mark: 'クラブ', number: 3, power: 2 },
  { mark: 'クラブ', number: 2, power: 1 }
]

# プレイヤークラスでセットアップ
class Player
  attr_accessor :name, :deck, :score

  def initialize(name)
    @name = name
    @deck = []
    @score = 0
  end
end

player1 = Player.new('たろう')
player2 = Player.new('じろう')
# プレイヤーを配列にする
players = [player1, player2]

# n人にカードを配る処理(今回は二人)
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
  # プレイヤーが場に出したカードを格納する配列を用意
  @draw_cards_array = []
  # 各プレイヤー毎にカードをドローする処理
  players.map do |player|
    # 自分の手札から一枚カードをドローする乱数dを定義
    d = rand(player.deck.length)
    puts "#{player.name}のカードは#{player.deck[d][:mark]}の#{player.deck[d][:number]}です。"

    # ドローしたカードからプレイヤーと強さを紐付けた配列に格納して@draw_cards_arrayに追加
    card_power = [player.name, player.deck[d][:power]]
    @draw_cards_array << card_power

    player.deck.delete_at(d)
  end
  # 最大値を見つけ、# 最大値を持つサブ配列をすべて見つける
  max_value = @draw_cards_array.map { |sub_array| sub_array[1] }.max

  winner_array = @draw_cards_array.select { |sub_array| sub_array[1] == max_value }

  get_card = @draw_cards_array.length
  if winner_array.length == 1
    @winner_name = winner_array[0][0]
    puts "#{@winner_name}が勝ちました。"

  else
    puts '引き分け'
    get_card += @draw_cards_array.length
    battle_cards(players)
  end
end

puts '戦争！'
puts '=================='
battle_cards(players)
puts '=================='
puts '戦争を終了します'
