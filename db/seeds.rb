user = User.find_or_create_by!(email: 'test@example.com') do |user|
  username = 'test'
  user.password = 'password123'
  user.password_confirmation = 'password123'
end

quotes_data = [
  { 
    content: '海賊王に、俺はなる！', 
    source: 'ONE PIECE', 
    scene: 1 
  },
  { 
    content: 'オレは死なねぇぜ。相棒、約束したんだ。', 
    source: 'ONE PIECE', 
    scene: 45 
  },
  { 
    content: '仲間がいるから強くなれる。', 
    source: 'ONE PIECE', 
    scene: 213 
  },
  { 
    content: 'あきらめたらそこで試合終了ですよ。', 
    source: 'SLAM DUNK', 
    scene: 27 
  },
  { 
    content: '俺は天才だからな。', 
    source: 'SLAM DUNK', 
    scene: 8 
  },
  { 
    content: 'まだ慌てるような時間じゃない。', 
    source: 'SLAM DUNK', 
    scene: 31 
  },
  { 
    content: '俺は絶対に諦めない。それが俺の忍道だ。', 
    source: 'NARUTO', 
    scene: 1 
  },
  { 
    content: '火影になる者は皆を認め、皆に認められる者だ。', 
    source: 'NARUTO', 
    scene: 72 
  },
  { 
    content: '等価交換だ。何かを得るには、同等の代価が必要になる。', 
    source: '鋼の錬金術師', 
    scene: 1 
  },
  { 
    content: '立って歩け。前へ進め。あんたには立派な足がついてるじゃないか。', 
    source: '鋼の錬金術師', 
    scene: 51 
  }
]

quotes_data.each do |quote_data|
  user.quotes.create!(quote_data)
end