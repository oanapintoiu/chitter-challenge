require 'user'

class UserRepository


    def all
        users = []
        sql = 'SELECT * FROM users;'
        result_set = DatabaseConnection.exec_params(sql, [])

        result_set.each do |record|
        user = User.new
        user.id = record['id'].to_i
        user.full_name = record['full_name']
        user.username = record['username']
        user.email = record['email']
        user.password = record['password']

        users << user
        end

        return users
    end


    def find(username)
        users = []
        sql = 'SELECT * FROM users WHERE username = $1;'
        result_set = DatabaseConnection.exec_params(sql, [username])

        return nil if !result_set

        record = result_set[0]

        user = User.new
        user.id = record['id'].to_i
        user.full_name = record['full_name']
        user.username = record['username']
        user.email = record['email']
        user.password = record['password']

        return users
    end

    def create(user)
        sql = 'INSERT INTO users (full_name, username, email, password) VALUES ($1, $2, $3, $4);'
        result_set = DatabaseConnection.exec_params(sql, [user.full_name, user.username, user.email, user.password])
    
        return user
      end

end
