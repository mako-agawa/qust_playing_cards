
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
  attr_accessor :name, :deck, :draw, :score

  def initialize(name)
    @name = name
    @deck = []
    @draw = {}
    @score = 0
  end
end

player1 = Player.new('たろう')
player2 = Player.new('じろう')
players = [player1, player2]

# プレイヤーを配列にする
puts '戦争！'

def deal_omni_deck(omni_deck, players)
  # プレイヤーの数
  num = players.length
  # デッキをよく切る！
  shuffle_deck = omni_deck.to_a.shuffle

  shuffle_deck.each_with_index do |card, index|
    player_index = index % num
    players[player_index].deck << card
  end
end

deal_omni_deck(omni_deck, players)

def open_card(players)
  stuck_score = 0
  players.map do |player|
    d = rand(player.deck.length)
    puts "#{player.name}のカードは#{player.deck[d][:mark]}の#{player.deck[d][:number]}です。"
    player.draw = player.deck[d]
    player.deck.delete_at(d)
  end

  max_power = players.map { |player| player.draw[:power] }.max
  selected_players = players.select { |player| player.draw[:power] == max_power }
  stuck_score += players.length



  if selected_players.length == 1
    selected_players[0].score += stuck_score
    stuck_score = players.length
    puts "#{selected_players[0].name}の勝利です"
    return
  elsif selected_players.length > 1
    puts '引き分け'
    stuck_score += players.length
  end

end

while player1.deck.length > 0 && player2.deck.length > 0
  if player1.deck.length ==0 || player2.deck.length == 0
    return
  else
    open_card(players)
  end
end


puts "プレイヤー1の手札の枚数は#{player1.score}枚です。プレイヤー2の手札の枚数は#{player2.score}枚です"
# puts "プレイヤー1が1位、プレイヤー2が2位です。"

puts "戦争を終了します"
