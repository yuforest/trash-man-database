ActiveRecord::Base.transaction do
  [
    { email: "test@gmail.jp", password: "password", password_confirmation: "password" },
  ].each do |item|
    admin = Admin.new(item)
    admin.save!
  end

  [
    { email: "test@entershare.jp", password: "password", password_confirmation: "password" },
    { email: "test1@entershare.jp", password: "password", password_confirmation: "password" },
    { email: "test2@entershare.jp", password: "password", password_confirmation: "password" },
    { email: "test3@entershare.jp", password: "password", password_confirmation: "password" },
    { email: "test4@entershare.jp", password: "password", password_confirmation: "password" },
    { email: "test5@entershare.jp", password: "password", password_confirmation: "password" },
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
end
