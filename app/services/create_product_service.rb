class CreateProductService
  def self.call
    Cart.create unless Cart.first.present?
    url = URI("https://fakestoreapi.com/products")
    
    https = Net::HTTP.new(url.host, url.port)
    https.use_ssl = true
    
    request = Net::HTTP::Get.new(url)
    
    response = https.request(request)
    puts response.read_body
    JSON.parse(response.read_body).each do |data|
      product = Product.find_or_create_by(title: data['title'])
      product.price = data['price']
      product.description = data['description']
      product.category = data['category']
      product.image = data['image']
      product.rating = data['rating']['rate']
      product.count = data['rating']['count']
      product.save!
    end
  end
end