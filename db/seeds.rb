# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

airports = ['ATL', "ORD", "LAX", "DFW", "DEN", "JFK", "SFO", "SEA", "LAS", "CLT", "EWR"]
airports.each do |item|
    Airport.create(code: item)
end

def time_rand
    from = Time.now 
    to = 1.days.from_now
    Time.at(from + rand * (to.to_f - from.to_f))
end

500.times do
    a = (1..10).to_a.shuffle 
    datetime = time_rand
    date = datetime.to_date
    start = datetime.strftime("%H:%M")
    duration = "2 Hours"
    start_id = a.pop
    finnish_id = a.pop
    Flight.create(start_id: start_id, finnish_id: finnish_id, duration: duration, date: date, start: start)
end
