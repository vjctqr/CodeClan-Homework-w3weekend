require_relative('models/film') 
require_relative('models/customer')
require_relative('models/ticket')
require_relative('models/screening')

require('pry-byebug')

Ticket.delete_all()
# Screening.delete_all()
Film.delete_all()
Customer.delete_all()

film1 = Film.new( {'title' => 'Blade Runner', 'price' => 10 } )
film2 = Film.new( {'title' => 'The Matrix', 'price' => 12} )
film3 = Film.new( {'title' => 'Mad Max: Fury Road', 'price' => 14} )
film4 = Film.new( {'tilte' => 'RoboCop', 'price' => 6 } )
film5 = Film.new( {'title' => 'The Mask', 'price' => 8} )

film1.save()
film2.save()
film3.save()
film4.save()
film5.save()

screening1 = Screening.new( { 'film_id' => film1.id, 'show_time' => '20:00' } )
screening2 = Screening.new( { 'film_id' => film1.id, 'show_time' => '21:00' } )
screening1.save()
screening2.save()

customer1 = Customer.new( {'name' => 'Tim', 'funds' => 300 } )
customer2 = Customer.new( {'name' => 'Max', 'funds' => 250} )
customer3 = Customer.new( {'name' => 'Jimmie', 'funds' => 1000} )
customer4 = Customer.new( {'name' => 'Anna', 'funds' => 20} )
customer5 = Customer.new( {'name' => 'Georgie', 'funds' => 40} )

customer1.save()
customer2.save()
customer3.save()
customer4.save()
customer5.save()

film1.price = '17'
film1.update()

customer1.funds = '150'
customer1.update()

ticket1.film_id = film3.id
ticket1.update()

films = Film.all()
customers = Customer.all()
tickets = Ticket.all()
screening = Screening.all()


binding.pry
nil