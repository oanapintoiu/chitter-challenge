require_relative 'peep'

class PeepRepository 
#     def sort_by_rev_time
#         peeps = []

#          # Send the SQL query and get the result set.
#         sql = 'SELECT id, peep_text, username, time_tag FROM peeps ORDER BY time_tag DESC;'
# result_set = DatabaseConnection.exec_params(sql, [])
# result_set.each do |record|
#     peep = Peep.new
#     peep.id = record['id'].to_i
#     peep.peep_text = record['peep_text']
#     peep.username = record['username']
#     peep.time_tag = record['time_tag']

#     peeps << peep
# end

# return peeps
# end

def sort_by_rev_time
sql = 'SELECT users.id, users.username, peeps.peep_text, peeps.time_tag, peeps.user_id
FROM users
JOIN peeps
ON peeps.user_id = users.id
ORDER BY peeps.time_tag DESC;'

    
    result_set = DatabaseConnection.exec_params(sql, [])
    peeps = []

    result_set.each do |record|

      peep = Peep.new
      peep.id = record['id'].to_i
      peep.peep_text = record['peep_text']
      peep.time_tag = record['time_tag']
      peep.user_id = record['user_id'].to_i
      peep.username = record['username']

      peeps << peep
    end
    return peeps
  end
end
