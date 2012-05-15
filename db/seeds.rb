matt = User.create(username: "mattyoho", email: "matt.yoho@livingsocial.com", password: 'hungry', password_confirmation: 'hungry')

matt_items = [
  {type: "TextItem", body: "Copy and paste is not a software design principle."},
  {type: "LinkItem", body: "I hear this place has some cool people in it.", link_url: "http://hungryacademy.com/"},
  {type: "ImageItem", body: "Cats are funny.", image_url: "http://www.funnycatpictures.net/wp-content/uploads/2012/04/funny-cat-riding-a-bike2.jpg"}
]

jeff = User.create(username: "j3", email: "jeff@jumpstartlab.com", password: 'hungry', password_confirmation: 'hungry')

jeff_items = [
  {type: "TextItem", body: "I've been thinking of buying a machete"},
  {type: "LinkItem", body: "I teach here!", link_url: "http://hungryacademy.com/"},
  {type: "ImageItem", body: "Cats are kinda dumb.", image_url: "http://cdn2.funnycorner.net/funny-pictures/6177/funny-cat-and-computer-mouse.jpg"}
]

21.times do |n|
  if rand(2) == 1
    attrs = matt_items[n % 3].dup
    kind = attrs.delete(:type)
    matt.feed.feed_item_of(kind).new(attrs).save

    attrs = jeff_items[n % 3].dup
    kind = attrs.delete(:type)
    jeff.feed.feed_item_of(kind).new(attrs).save
  else
    attrs = jeff_items[n % 3].dup
    kind = attrs.delete(:type)
    jeff.feed.feed_item_of(kind).new(attrs).save

    attrs = matt_items[n % 3].dup
    kind = attrs.delete(:type)
    matt.feed.feed_item_of(kind).new(attrs).save
  end
end

