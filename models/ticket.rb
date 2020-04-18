require_relative("../db/sql_runner")

class Ticket

    attr_reader :id
    attr_accessor :film_id, :customer_id

    def intialize(option)
        @id = options['id'].to_i if options['id']
        @film_id = options['film_id']
        @customer_id = options['customer_id']
        
    end

    def save()
        sql = "INSERT INTO tickets (film_id, customer_id) VALUES ($1, $2) RETURNING ID"
        values = [film_id, customer_id]
        ticket = SqlRunner.run(sql, values)[0];
        @id = ticket['id'].to_i
    end

end


