module SessionsHelper
	def self.login(email, password)
		json_res = nil
		response = WebFunctions.method_url_call("post", 
			"http://47.96.153.174:9050/oauth2/token", 
			params={"client_id": "NSnc8CK3ceqozl8vlwi46A", 
				"client_secret": "h-_hEIFPWZoVUZjWcNIKrzO208VC56P7KI41gMW1IAtED8r1RYx_b63i24EgjlOVg8ZQkqmqyUuQe57_arLYSQ",
				"grant_type": "password", 
				"username": email, 
				"password": password})
		if response[0] == "200"
			json_res = JSON.parse(response[1])
		end
		return json_res
	end
end