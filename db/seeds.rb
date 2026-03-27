# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
User.destroy_all
Post.destroy_all


User.create(email: "sam@google.com", password: "123456", username: "Sam Matey-Coste", role: "Lurker")
User.create(email: "charlie@google.com", password: "123456", username: "Charlie Durand", role: "Lurker")
User.create(email: "james@google.com", password: "123456", username: "James Horton", role: "Lurker")

Post.create(title: "Review: Inheritors of the Earth by Chris D. Thomas",
content: "Since I was a little kid, I've been fascinated by environmental questions; this newsletter is about the relationship between humanity and its biosphere, after all. One of the sub-fields of environmental science that never made quite as much sense to me was “invasive species biology,” the idea that humans' rapid introduction of many species to new continents is always -or at least mostly- a bad thing, with detrimental effects on the local ecosystem. Despite growing counterevidence, this paradigm is still pretty commonly accepted in the wildlife conservation field at the moment; a new United Nations report was just published excoriating invasive species, and the United States government continues to fund large anti-invasive species programs.
<br>At first, the only real counterweight I had was my own anecdotal experience. On my way to class as a teenager in Maine, I'd routinely pass Japanese honeysuckle bushes in flower, with a wide range of native bumblebee species and other pollinators supping at the feast. Later, as a volunteer research assistant in the Vatovavy region of Madagascar, I learned that the critically endangered greater bamboo lemur had grown to rely on the invasive soapbush (Clidemia hirta) as a source of “weaning food” berries to help their young transition from milk to bamboo. I also noted that “invasive” eucalyptus trees from Australia were prized by the local people as a source of throat-soothing medicines, and seemed to be doing no harm to the local ecosystem as one of many tree species in the forest.
<br>The book that really crystallized my thinking on this was Inheritors of the Earth: How Nature is Thriving in the Age of Extinction, by Professor Chris D. Thomas, Director of the Leverhulme Centre for Anthropocene Biodiversity at the University of York. It came out in 2017 to a smattering of positive, surprised-seeming reviews, but in my view didn't make near as much of an impact as it should have. This book really deserved to be a Silent Spring-level shift in the zeitgeist!",
user: User.first,
draft_or_published: "published"
)
Post.create(title: "You and Your Shadow",
content: "Like all shadows the length and depth of it are determined by the positioning of a greater light, the science of which I will never fully understand. What I do know is that most of the time the shadow is cast by real things, and yawns behind them, like a small tear in the substrate of God.
<br>Shadow is an apt metaphor—fear as the flat, dark, negative geometry cast on the ground behind something true. The accuracy of this kind of poetry is alarming. Only a few other metaphors, mostly simple and elemental, fit their subject so well. Anger as fire. Life as motion. Love as light. I think because of this apt-ness, the fear-as-shadow metaphor has a long history. The earliest example I know of is an old medical text—Galen's De Locis Affectis, written when medics thought that the despondent emotions were caused by black bile (literally, melancholia). Galen described fear as a shadow that melancholia cast on the mind.",
user: User.last,
draft_or_published: "published"
)

puts "Successful seed run"
