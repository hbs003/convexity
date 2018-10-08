puts 'Cleaning database...'
Offer.destroy_all
Review.destroy_all
Stock.destroy_all
Founder.destroy_all
Enterprise.destroy_all
User.destroy_all

puts 'Cleaned database...'


puts 'Creating enterprises...'
enterprises_attributes = [
  {
    name:         'Dishoom',
    abstract:  'Buzzy destination for Indian street food in Bombay-style vintage decor.',

  },
  {
    name:         'Pizza East',
    abstract:  'Pizzeria with industrial looks, serving rustic pizza and antipasti.',
  }
]
Enterprise.create!(enterprises_attributes)
puts 'created enterprises!'

puts 'creating enterprises photos!'
e1 =  Enterprise.first
e2 =  Enterprise.last
url1 = "https://wamda-prod.s3.amazonaws.com/feature-images/53ce9644a32beb0.png"
url2 = "http://xadas5.com/wp-content/uploads/2013/02/visa-logo2.jpg"

e1.remote_photo_url = url1
e1.save
e2.remote_photo_url = url2
e2.save
puts 'created enterprises photos!'

puts 'Creating offers...'
offers_attributes = [
  {
    enterprise_id: e1.id,
    description: "People who listen to podcasts really, really love podcasts. The US podcast audience has doubled in the last 4 years. There are 73 million people in the United States listening monthly, and once they start, they listen a lot: on RadioPublic people listen for 72 minutes each day. The podcast industry is booming, and RadioPublic is building the missing marketplace for creators, fans, and brands.",
    share: "10",
    pu: "1000",
    units: "1000",
    final_date: "10/12/2018",

  },
  {
    enterprise_id: e2.id,
    description: "Podcasts are not easy to skim or scan, so how does a listener know where to start, or what to listen to next? And once you find something, how do you support the show, or keep track of things you heard?",
    share: "15",
    pu: "500",
    units: "1500",
    final_date: "10/12/2018",

  },
]
Offer.create!(offers_attributes)
puts 'created offers!'

puts 'Creating founders...'
founders_attributes = [
  {
    enterprise_id: e1.id,
    description: "An early innovator who has helped shape the podcast and public radio industries, Jake Shapiro co-founded and is the former CEO of PRX, the award-winning distributor of independent audio content, including This American Life, The Moth Radio Hour, and the Radiotopia podcast network. PRX is the recipient of several Peabody Awards, Webby Awards, and the prestigious MacArthur Foundation’s Creative and Effective Institutions award. While at PRX, Shapiro also helped found Matter Ventures, the accelerator and investment fund for mission-driven startups.  Jake is the former associate director and now a senior fellow at the Berkman Klein Center for Internet and Society at Harvard University (where podcasting was first invented in 2003), and a fellow at Ashoka, the global network of social entrepreneurs.",
    name: "Jake Shapiro",
    function: "CEO",

  },
  {
    enterprise_id: e1.id,
    description: "An early innovator who has helped shape the podcast and public radio industries, Jake Shapiro co-founded and is the former CEO of PRX, the award-winning distributor of independent audio content, including This American Life, The Moth Radio Hour, and the Radiotopia podcast network. PRX is the recipient of several Peabody Awards, Webby Awards, and the prestigious MacArthur Foundation’s Creative and Effective Institutions award. While at PRX, Shapiro also helped found Matter Ventures, the accelerator and investment fund for mission-driven startups.  Jake is the former associate director and now a senior fellow at the Berkman Klein Center for Internet and Society at Harvard University (where podcasting was first invented in 2003), and a fellow at Ashoka, the global network of social entrepreneurs.",
    name: "Henrique Silva",
    function: "CTO",

  },
  {
    enterprise_id: e2.id,
    description: "An early innovator who has helped shape the podcast and public radio industries, Jake Shapiro co-founded and is the former CEO of PRX, the award-winning distributor of independent audio content, including This American Life, The Moth Radio Hour, and the Radiotopia podcast network. PRX is the recipient of several Peabody Awards, Webby Awards, and the prestigious MacArthur Foundation’s Creative and Effective Institutions award. While at PRX, Shapiro also helped found Matter Ventures, the accelerator and investment fund for mission-driven startups.  Jake is the former associate director and now a senior fellow at the Berkman Klein Center for Internet and Society at Harvard University (where podcasting was first invented in 2003), and a fellow at Ashoka, the global network of social entrepreneurs.",
    name: "Rodrigo JAJA",
    function: "CEO",

  },
    {
    enterprise_id: e1.id,
    description: "An early innovator who has helped shape the podcast and public radio industries, Jake Shapiro co-founded and is the former CEO of PRX, the award-winning distributor of independent audio content, including This American Life, The Moth Radio Hour, and the Radiotopia podcast network. PRX is the recipient of several Peabody Awards, Webby Awards, and the prestigious MacArthur Foundation’s Creative and Effective Institutions award. While at PRX, Shapiro also helped found Matter Ventures, the accelerator and investment fund for mission-driven startups.  Jake is the former associate director and now a senior fellow at the Berkman Klein Center for Internet and Society at Harvard University (where podcasting was first invented in 2003), and a fellow at Ashoka, the global network of social entrepreneurs.",
    name: "Gerozezim",
    function: "COO",

  },
  {
    enterprise_id: e2.id,
    description: "An early innovator who has helped shape the podcast and public radio industries, Jake Shapiro co-founded and is the former CEO of PRX, the award-winning distributor of independent audio content, including This American Life, The Moth Radio Hour, and the Radiotopia podcast network. PRX is the recipient of several Peabody Awards, Webby Awards, and the prestigious MacArthur Foundation’s Creative and Effective Institutions award. While at PRX, Shapiro also helped found Matter Ventures, the accelerator and investment fund for mission-driven startups.  Jake is the former associate director and now a senior fellow at the Berkman Klein Center for Internet and Society at Harvard University (where podcasting was first invented in 2003), and a fellow at Ashoka, the global network of social entrepreneurs.",
    name: "Piotr",
    function: "CTO",

  },
  {
    enterprise_id: e2.id,
    description: "An early innovator who has helped shape the podcast and public radio industries, Jake Shapiro co-founded and is the former CEO of PRX, the award-winning distributor of independent audio content, including This American Life, The Moth Radio Hour, and the Radiotopia podcast network. PRX is the recipient of several Peabody Awards, Webby Awards, and the prestigious MacArthur Foundation’s Creative and Effective Institutions award. While at PRX, Shapiro also helped found Matter Ventures, the accelerator and investment fund for mission-driven startups.  Jake is the former associate director and now a senior fellow at the Berkman Klein Center for Internet and Society at Harvard University (where podcasting was first invented in 2003), and a fellow at Ashoka, the global network of social entrepreneurs.",
    name: "Thithi Lobats",
    function: "CFO",

  },
]
Founder.create!(founders_attributes)
puts 'created founders!'
