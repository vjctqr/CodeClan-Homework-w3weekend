require_relative('../db/sql_runner.rb')

class Screening

    attr_reader :id
    attr_accessor :screening, :show_time

    def initialize( options )
        @id = options['id'] if options['id']
        @film_id = options['show_time']
        @show_time = options['show_time']
    end

    def save()
        sql = "INSERT INTO screenings
        (film_id, show_time)
        VALUES
        ($1, $2)
        RETURNING id;"
        values = [@film_id, @show_time]
        screening = SqlRunner.run(sql, values).first
        @id = screening['id'].to_i
    end

    def update()
        sql = "UPDATE screenings
        SET (film_id, show_time) = ($1, $2)
        WHERE id = $3"
        values = [@film_id, @show_time, @id]
        SqlRunner.run(sql, values)
    end

end