require 'sqlite3'
require 'singleton'

class QuestionsDBConnection < SQLite3::Database 
include Singleton

    def initialize 
        super ('questions.db')
        self.type_translation = true 
        self.results_as_hash = true 
    end
end
class Questions 

    attr_accessor :id, :body, :title, :author_id

    def self.all
        data = QuestionsDBConnection.instance.execute("SELECT * FROM questions")

        data.map {|datum| Questions.new(datum)}  
    end

    def initialize(options)
        @id = options['id']
        @body = options['body']
        @title = options['title']
        @author_id = options['author_id']
    end

    def self.find_by_id(id)
        question = QuestionsDBConnection.instance.execute(<<-SQL, id)
        SELECT 
            *
        FROM 
            questions 
        WHERE 
            id = ?
        SQL
        return nil unless question.length > 0

        question.map {|datum| Questions.new(question.first)}
    end

    def create
        raise "#{self} already in database" if self.id 
        QuestionsDBConnection.instance.execute(<<-SQL, self.body, self.title, self.author_id)
        INSERT INTO 
            questions (body, title, author_id)
        VALUES
            (?,?,?)
        SQL
        self.id = QuestionsDBConnection.instance.last_instance_row_id
    end

    def update
    raise "#{self} not in database" unless self.id
    QuestionsDBConnection.instance.execute(<<-SQL, self.body, self.title, self.author_id)
      UPDATE
        questions
      SET
        body = ?, title = ?, author_id = ? 
      WHERE
        id = ?
    SQL
    end
end



class Users

    attr_accessor :id, :fname, :lname  

    def self.all
        data = UserDBConnection.instance.execute("SELECT * FROM users")
        data.map {|datum| Users.new(datum)}  
    end

    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end

    def self.find_by_name(fname, lname)
        person = UsersDBConnection.instance.execute(<<-SQL, self.id, self.fname, self.lname)
        SELECT
            *
        FROM
            users
      WHERE
        fname = ?
    SQL
    return nil unless person.length > 0 

    Users.new(person.first)
    end

end