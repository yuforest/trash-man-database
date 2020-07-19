ActiveRecord::Base.transaction do
  [
    { email: "test@gmail.jp", password: "password", password_confirmation: "password" },
  ].each do |item|
    admin = Admin.new(item)
    admin.save!
  end

  [
    { email: "test@gmail.jp", password: "password", password_confirmation: "password" },
    { email: "test1@gmail.jp", password: "password", password_confirmation: "password" },
    { email: "test2@gmail.jp", password: "password", password_confirmation: "password" },
  ].each do |u|
    user = User.new(u)
    user.skip_confirmation!
    user.save!

    post = Post.new({
             user_id: user.id,
             title: '初デートでサイゼ、、、しかも割り勘',
             category: "ケチ"
           })
    post.content.body = "マッチングアプリであった人と初めてのデート。
    しばらく会話を交わして連れて行かれたのはなんとサイゼリア。
    美味しいからいいんだけどそういうことじゃない感が半端なかった。"
    post.save!
  end

  [
    { name: "ホスト" },
    { name: "バンドマン" },
    { name: "美容師" },
    { name: "資産家" },
    { name: "ヤンキー" },
    { name: "パチンコ" },
    { name: "競馬" },
    { name: "社長" },
    { name: "無職" },
    { name: "ヒモ" },
    { name: "ニート" },
    { name: "タバコ" },
    { name: "酒" },
    { name: "風俗" },
  ].each do |item|
    tag = Tag.new(item)
    tag.save!
  end
end
