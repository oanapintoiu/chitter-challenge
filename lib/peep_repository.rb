require 'peep'

class PeepRepository 
#     def all
#         peeps = []

#          # Send the SQL query and get the result set.
#         sql = 'SELECT id, peep_text, username, time_tag FROM peeps;'
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
    peeps = []
    sql = 'SELECT * FROM peeps ORDER by time_tag DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      peep = Peep.new
      peep.id = record['id'].to_i
      peep.peep_text = record['peep_text']
      peep.username = record['username']
      peep.time_tag = record['time_tag']
    
      peeps << peep
    end
      
    return peeps
  end
end
