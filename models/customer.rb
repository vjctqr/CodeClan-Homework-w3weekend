require_relative('../db/sql_runner.rb')

class Customer

    attr_reader :id
    attr_accessor :name, :funds, :tickets_held

    def initialize( options )
        @id = options['id'] if options['id']
        @name = options['name']
        @funds = options['funds']
        @tickets_held = 0
    end

    def save() 
        sql = "INSERT INTO customers (name, funds) VALUES ($1, $2) RETURNING id"
        values = [@name, @funds]
        customer = SqlRunner.run(sql, values).first
        @id = customer['id'].to_i
    end

    def update()
        sql = "UPDATE customers set (name, finds) = ($1, $2) WHERE id = $3"
        values = [@name, @funds, @id]
        SqlRunner.run(sql, values)
    end

    # def delete()
    #     sql = "DELETE from customers where id = $1"
    #     values = [@id]
    #     SqlRunner.run(sql, values)
    # end

    def films()
        sql = "SELECT films.* FROM films INNER JOIN tickets ON tickets.film_id = film.id WHERE customer_id = $1"
        values = [@id]
        films = SqlRunner.run(sql, values)
        return Film.map_items(films)
    end

    def tickets()
        sql = "SELECT * FROM tickets WHERE tickets.customer_id =$1"
        values = [@id]
        tickets = SqlRunner.run(sql. values)
        return Ticket.map_items(tickets)
    end

    def purchase_ticket(film)
        ticket = Ticket.new( { 'customer_id' => @id, 'film_id' => film.id } )
        ticket.save()
        funds = @funds.to_i
        price = film.price.to_i
        @funds = (funds - price).to_s
        @no_of_tickets += 1
        update()
    end

    def self.all()
        sql = "SELECT * FROM customers"
        customers = SqlRunner.run(sql)
        return Customer.map_items(customers)
    end

    def self.delete_all()
        sql = "DELETE FROM customers"
        SqlRunner.run(sql)
    end

    def self.map_items( customers )
        result = customers.map{ |customer| Customer.new(customer) }
    end


end

