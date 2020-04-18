require_relative("../db/sql_runner")

class Customer

    attr_reader :id
    attr_accessor :first_name, :funds

    def initialize(options)
        @id = options['id'].to_i if options['id']
        @first_name = options['name']
        @funds = options['funds']
    end

    def save()
        sql = "INSERT INTO customer (first_name, funds) VALUES ($1, $2) RETURNING id"
        values = [@first_name, @funds]
        customer = Sql.Runner.run(sql, values).first
        @id = customer['id'].to_i
    end

end

