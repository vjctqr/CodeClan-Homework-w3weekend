require_relative('models/ticket')
require_relative('models/film')
require_relative('models/customer')

require('pry-byebug')

film1 = Film.new( {'title' => 'Blade Runner', 'price' => 10 } )

film1.save()

customer1 = Customer.new( {'first_name' => 'Tim', 'funds' => 300} )

customer.save()

ticket1 = Ticket.new( { 'film_id' => film1.id, 'customer_id' => customer1.id} )

ticket.save()



binding.pry
nil