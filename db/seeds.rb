# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
tags = Tag.create([
    {
        name: "general"
    },
    {
        name: "crypto"  
    },
    {
        name: "computing"  
    },
    {
        name: "funny"  
    },
    {
        name: "others"
    }
])

users = User.create{[
    {
        username: "ab",
        cryptowallet: "0xcb3c44718789f3eA8E3E8195dBd0a8e88Dd53469"
    }
]}

posts = Post.create([
  { 
    title: "How is everyone doing?",
    body: "Now that winter break is over, how did everyone spend it? Here's to an exciting and fruitful 22/23 sem 2! All the best!",
    upvotes: 3,
    poster: "ab",
    tag: tags.first,
    user: users.first
  }
])

comments = Comment.create([
    {
        body: "Doing great!!",
        upvotes: 1,
        commentor: "ab",
        post: posts.first,
        user: users.first  
    }
])