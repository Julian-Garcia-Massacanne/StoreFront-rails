require "date"


Category.create!(name: "Remeras")
Category.create!(name: "Pantalones")
Category.create!(name: "Gorras")
Category.create!(name: "Otros")


products = [
  { name: "Remera de Boca", description: "Remera de Boca 2023", unit_price: 100, stock: 10, size: "M", color: "Azul y amarillo", entry_date: Date.today, last_modified: DateTime.now, category_id: 1},
  { name: "Remera de San Lorenzo", description: "Remera de San Lorenzo 2024", unit_price: 90, stock: 15, size: "S", color: "Rojo y Azul", entry_date: Date.today, last_modified: DateTime.now, category_id: 1 },
  { name: "Pantalon River", description: "Pantalon River", unit_price: 60, stock: 5, size: "S", color: "Rojo y Blanco", entry_date: Date.today, last_modified: DateTime.now, category_id: 2 },
  { name: "Gorra New Era", description: "Gorra", unit_price: 30, stock: 0, size: "", color: "Negro", entry_date: Date.today, last_modified: DateTime.now, category_id: 3 }
]

products.each do |product_params|
  product = Product.create!(product_params)
  
  # Adjuntar imagen
  image_path = Rails.root.join("public/images/#{product.name}.jpeg")
  
  if File.exist?(image_path)
    product.images.attach(
      io: File.open(image_path), 
      filename: "#{product.name}.jpeg", 
      content_type: 'image/jpeg'
    )
  end
end

users = [
  { username: "admin_user", email: "admin@gmail.com", password: "password123", role: 2, entry_date: Date.today, phone: "2244446098" },
  { username: "manager_user", email: "manager@gmail.com", password: "password123", role: 1, entry_date: Date.today, phone: "0987654321" },
  { username: "employee_user", email: "employee@gmail.com", password: "password123", role: 0, entry_date: Date.today, phone: "1122334455" }
]

# Insert the users into the database
users.each do |user|
  User.create!(user)
end


clients = [
  {name: "Juan",lastname: "Pérez González",dni: "45621433",phone: "1234-5678"
  },
  {name: "María",lastname: "Rodriguez Sánchez",dni: "42685762", phone: "8765-4321"
  }
]

clients.each do |client_params|
  Client.create!(client_params)
end