User.destroy_all
user1 = User.create(email: "michael@gmail.com", password: "testing")
user2 = User.create(email: "sarah@gmail.com", password: "testing")
user3 = User.create(email: "jim@gmail.com", password: "testing")

Sub.destroy_all
sub1 = Sub.create(title: "Computers", description: "All about computers", moderator_id: user1.id)
sub2 = Sub.create(title: "Dogs", description: "Everyone loves dogs, let's post everything about dogs!", moderator_id: user2.id)
sub3 = Sub.create(title: "Cats", description: "Share cool cat pics", moderator_id: user3.id)

Post.destroy_all
post1 = Post.create!(
  author_id: user2.id,
  title: "A cat with a computer keyboard",
  url: "https://tenor.com/search/cat-on-computer-gifs",
  content: "Check out this cat on a computer"
)
subpost1 = PostSub.create!({
  post_id: post1.id,
  sub_id: sub1.id
})
subpost2 = PostSub.create!({
  post_id: post1.id,
  sub_id: sub3.id
})
post2 = Post.create!(
  author_id: user1.id,
  title: "Macbook air's are great",
  url: "https://www.apple.com/macbook-air/",
  content: "Check out this cat on a computer"
)
subpost3 = PostSub.create!({
  post_id: post2.id,
  sub_id: sub1.id
})