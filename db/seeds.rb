# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Thinker.delete_all
Thought.delete_all
Follow.delete_all
Thumb.delete_all

nietzsche = Thinker.create(name: 'Nietzsche', email: 'nietzsche@example.com', url: 'http://en.wikipedia.org/wiki/Nietzsche', image_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/1/1b/Nietzsche187a.jpg/338px-Nietzsche187a.jpg')
descartes = Thinker.create(name: 'Descartes', email: 'descartes@example.com', url: 'http://en.wikipedia.org/wiki/Descartes', image_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg/360px-Frans_Hals_-_Portret_van_Ren%C3%A9_Descartes.jpg')
aristotle = Thinker.create(name: 'Aristotle', email: 'aristotle@example.com', url: 'http://en.wikipedia.org/wiki/Aristotle', image_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/a/ae/Aristotle_Altemps_Inv8575.jpg/330px-Aristotle_Altemps_Inv8575.jpg')
plato = Thinker.create(name: 'Plato', email: 'plato@example.com', url: 'http://en.wikipedia.org/wiki/Plato', image_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/8/88/Plato_Silanion_Musei_Capitolini_MC1377.jpg/330px-Plato_Silanion_Musei_Capitolini_MC1377.jpg')
socrates = Thinker.create(name: 'Socrates', email: 'socrates@example.com', url: 'http://en.wikipedia.org/wiki/Socrates', image_url: 'http://upload.wikimedia.org/wikipedia/commons/thumb/a/a4/Socrates_Louvre.jpg/330px-Socrates_Louvre.jpg')
jackhandey = Thinker.create(name: 'Jack Handey', email: 'jackhandey@example.com', url: 'http://en.wikipedia.org/wiki/Jack_Handey', image_url: 'http://images.usatoday.com/Wires2Web/20080412/2997740568_Books_Jack_Handeyx.jpg')

aristotelian = Thought.create(thinker: aristotle, thought: 'A friend to all is a friend to none.')
platonic = Thought.create(thinker: plato, thought: 'A good decision is based on knowledge and not on numbers.')
socratic = Thought.create(thinker: socrates, thought: 'I know nothing except the fact of my ignorance.')
cartesian = Thought.create(thinker: descartes, thought: 'I think therefore I am. But I\'m nobody until my thoughts are shared on this website.')
nietzschist = Thought.create(thinker: nietzsche, thought: 'Nobody follows me!')
trees = Thought.create(thinker:jackhandey, thought: 'If trees could scream, would we be so cavalier about cutting them down? We might, if they screamed all the time, for no good reason.')

Follow.create(follower: aristotle, followee: plato)
Follow.create(follower: aristotle, followee: socrates)
Follow.create(follower: plato, followee: socrates)
Follow.create(follower: descartes, followee: socrates)
Follow.create(follower: descartes, followee: aristotle)
Follow.create(follower: descartes, followee: plato)

Thumb.create(thinker: plato, thought: socratic)
Thumb.create(thinker: descartes, thought: socratic)
Thumb.create(thinker: descartes, thought: aristotelian)
Thumb.create(thinker: descartes, thought: platonic)
Thumb.create(thinker: nietzsche, thought: nietzschist)
Thumb.create(thinker: nietzsche, thought: trees)
Thumb.create(thinker: descartes, thought: trees)
Thumb.create(thinker: aristotle, thought: trees)
Thumb.create(thinker: plato, thought: trees)
Thumb.create(thinker: socrates, thought: trees)
Thumb.create(thinker: jackhandey, thought: trees)

