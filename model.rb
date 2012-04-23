MongoMapper.connection = Mongo::Connection.new('staff.mongohq.com', 10092)
MongoMapper.database = '???'
MongoMapper.database.authenticate('???','???')

#class Article
 # include MongoMapper::Document
  #key :article, String
  #key :email, String

  #timestamps!
#end