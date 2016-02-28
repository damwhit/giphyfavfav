class APICall
  def self.image_path
    response = Faraday.get("http://api.giphy.com/v1/gifs/random?api_key=dc6zaTOxFJmzC&tag=#{@search_term}")
    data = JSON.parse(response.body, object_class: OpenStruct).data
    image_path = data.image_url
  end
end
