require_relative("../db/sql_runner")

class Film
    
    attr_reader :id
    attr_accessor :title, :price

    def initialize(options)
        @id = options['id'].to+i if opitons['id']
        @title = options['title']
        @price = options['price']
    end

    def save()
        sql = "INSERT INTO films (title, price) VALUES ($1, $2) RETURNING id"
        values = [@title, @price]
        film = SqlRunner.run(sql, values).first
        @id = movie['id'].to_i
    end   

end