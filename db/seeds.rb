6.times do |article|
  Article.create!(
    title: "Title",
    body: "Body",
    image: open("#{Rails.root}/db/fixtures/image01.jpg")
  )
end
