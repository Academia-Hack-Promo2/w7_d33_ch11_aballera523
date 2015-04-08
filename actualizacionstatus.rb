require 'httparty'

class Consumer
	include HTTParty
	base_uri 'hackapi.jgab.net/api/users'

	def list
		self.class.get('')
	end

	def get(username)
		self.class.get('/' +username.to_s)
	end

	def add(user)
		options = {body: user}
		self.class.post('', options)		
	end

	def edit(username, user)
		options = {body: user}
		self.class.put('/'+username.to_s, options)
	end

	def delete(username)
		self.class.delete('/' +username.to_s)
	end

end

consumer = Consumer.new

consumer.add({ 
	address: "Av Orinoco Res Monte Alegre 2 Bello Monte Ccs",
	fullname: "Alexander Ballera",
	username: "@alexballera", 
	firstName: "Alexander", 
	lastName: "Ballera", 
	gender: "male", 
	email: "alexballera@gmail.com", 
	phone: "04120172898",
	status: "active" })
puts consumer.list