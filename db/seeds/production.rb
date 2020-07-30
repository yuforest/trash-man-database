ActiveRecord::Base.transaction do
  [
    { email: "test@gmail.com", password: "password", password_confirmation: "password" },
  ].each do |item|
    admin = Admin.new(item)
    admin.save!
  end

  [
    {
      email: "test@gmail.com",
      password: "vKLERP8io8XQZBHf",
      password_confirmation: "vKLERP8io8XQZBHf",
      profile: {name: "K", image: Rails.root.to_s + "/public/seeds/imgs/users/user1.jpg"}
    },
    {
      email: "test1@gmail.com",
      password: "XhV5tC4BToiIgMvo",
      password_confirmation: "XhV5tC4BToiIgMvo",
      profile: {name: "ami", image: Rails.root.to_s + "/public/seeds/imgs/users/user2.jpg"}
    },
    {
      email: "test2@gmail.com",
      password: "kEbRwous9jEaADeD",
      password_confirmation: "kEbRwous9jEaADeD",
      profile: {name: "くまさん", image: Rails.root.to_s + "/public/seeds/imgs/users/user3.jpg"}
    },
  ].each do |u|
    user = User.new(u.except(:profile))
    user.skip_confirmation!
    user.save!
    profile = user.user_profile
    profile.name = u[:profile][:name]
    profile.image = File.open(u[:profile][:image])
    profile.save!
  end

  [
    { id: 1, name: "ホスト" },
    { id: 2, name: "バンドマン" },
    { id: 3, name: "美容師" },
    { id: 4, name: "資産家" },
    { id: 5, name: "ヤンキー" },
    { id: 6, name: "パチンコ" },
    { id: 7, name: "競馬" },
    { id: 8, name: "社長" },
    { id: 9, name: "無職" },
    { id: 10, name: "ヒモ" },
    { id: 11, name: "ニート" },
    { id: 12, name: "タバコ" },
    { id: 13, name: "酒" },
    { id: 14, name: "風俗" },
    { id: 15, name: "知らない人" },
    { id: 16, name: "キャバクラ" },
  ].each do |item|
    tag = Tag.new(item)
    tag.save!
  end

  [
    {
      title: "初デートでサイゼ、、、しかも割り勘",
      content: "マッチングアプリであった人と初めてのデート。しばらく会話を交わして連れて行かれたのはなんとサイゼリア。
      美味しいからいいんだけどそういうことじゃない感が半端なかった。",
      category_id: 5,
      user_id: rand(1..3),
      tags: [2]
    },
    {
      title: "頭おかしい",
      content: "この前駅で肩からぶつかってきて一言も誤らずに去って行っておっさんがいた。
                あれは絶対わざとやっているんだと思う。",
      category_id: 16,
      user_id: rand(1..3),
      tags: [15]
    },
    {
      title: "ヤバイ客が多い",
      content: "そこそこの金を落としてくれる良客の予感と思いきや、いきなり偉そうに説教始めてほんと萎えた。
    最近はストーカー気質の客も多いしそろそろ足の洗い時かもしれない。。",
      category_id: 17,
      user_id: rand(1..3),
      tags: [16]
    },
    {
      title: "ないわ",
      content: "仕事やめてからずっとパチンコ行ってる。コロナも流行ってるし、流石にやめて欲しい。",
      category_id: 11,
      user_id: rand(1..3),
      tags: [6]
    },
    {
      title: "すぐに手が出る",
      content: "昼間から酒飲んでるし、直ぐに手が出る。こんな人だとは思ってなかったし、そろそろ限界",
      category_id: 4,
      user_id: rand(1..3),
      tags: [5]
    },
    {
      title: "強引なキャッチ",
      content: "ホストクラブとか行く気ないのに街歩いてると声かけてくるのほんとやめて欲しい",
      category_id: 17,
      user_id: rand(1..3),
      tags: [1]
    },
    {
      title: "ヒモ",
      content: "3ヶ月前からその辺で拾ったヒモと同居してる。クズなんだけどどこか憎めない、、",
      category_id: 13,
      user_id: rand(1..3),
      tags: [10]
    },
    {
      title: "歩きタバコしてる人",
      content: "子供に火が当たったらどうなるか考えたことないのかな？しかも吸い殻はポイ捨て。信じられない",
      category_id: 16,
      user_id: rand(1..3),
      tags: [12]
    },
    {
      title: "自慢だけ",
      content: "○億持ってるとか言ってるけど、全然金を落としてくれない。自慢だけしにくるのはこっちもきついしやめて欲しい。",
      category_id: 7,
      user_id: rand(1..3),
      tags: [4]
    },
    {
      title: "セックスレス",
      content: "2年付き合って最近はセックスレスだけど、こっそり風俗には行っていることが発覚。どう料理してやろうかな。",
      category_id: 2,
      user_id: rand(1..3),
      tags: [14]
    },

  ].each do |item|
    post = Post.new(item.except(:content, :tags))
    post.content.body = item[:content]
    item[:tags].each do |tag_id|
      post.post_tags.new(tag_id: tag_id)
    end
    post.save!
  end
end
