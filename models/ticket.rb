# require_relative("../db/sql_runner")

class Ticket

    attr_reader :id
    attr_accessor :customer_id, :film_id

    def intialize( option )
        @id = options['id'] if options['id']
        @customer_id = options['customer_id']
        @film_id = options['film_id']
    end

    def save()
        sql = "INSERT INTO tickets (customer_id, film_id) VALUES ($1, $2) RETURNING id"
        values = [@customer_id, @film_id]
        ticket = SqlRunner.run(sql, values).first
        @id = ticket['id'].to_i
    end

    def update()
        sql = "UPDATE tickets SET (customer_id, film_id) = ($1 ,$2) WHERE id = $3"
        values = [@customer_id, @film_id, @id]
        SqlRunner.run(sql, values)
    end
    
   


    def self.all()
        sql = "SELECT * FROM tickets"
        tickets = Sqlrunner.run(sql)
        return self.map_items(tickets)
    end

    def self.delete_all()
        sql = "DELETE FROM tickets"
        SqlRunner.run(sql)
    end

    def self.map_items(ticket_data)
        return tickets.map{ |ticket| Ticket.new(ticket) }
    end


end


