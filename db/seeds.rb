Country.destroy_all
Region.destroy_all
City.destroy_all
Location.destroy_all
Machine.destroy_all
User.destroy_all
Vehicle.destroy_all

#################### Countries
spain = Country.create!(name: 'España', code: 'spn')
portugal = Country.create!(name: 'Portugal', code: 'pt')
switzerland = Country.create!(name: 'Suiza', code: 'sch')

puts '#### Countries OK'

#################### Regions Array
regions_data = {
  spain.id => ['Comunidad Valenciana', 'Comunidad de Madrid', 'Cataluña', 'Galicia'],
  portugal.id => ['Lisboa', 'Oporto'],
  switzerland.id => ['Zúrich', 'Ginebra', 'Basilea', 'Berna']
}

############ Create Regions
regions_data.each do |country_id, regions|
  regions.each do |region_name|
    Region.create!(name: region_name, country_id: country_id)
  end
end

puts '#### Regions OK'

regions = Region.all

############Cities
regions.each do |region|
  rand(3..10).times do
    city = City.create!(name: "#{region.name} City #{rand(1..100)}", region_id: region.id)
    # Charge Stations 1-10 for city
    rand(1..10).times do

      location = Location.create!(name: "#{city.name} Location #{rand(1..100)}", address: "address #{rand(1..100)}", city_id: city.id)

      #3-6 Machines for Station
      rand(3..6).times do
        Machine.create!(
          name: "Machine #{rand(1..100)}",
          model: "Model #{rand(1..5)}",
          supplier: "Supplier #{rand(1..5)}",
          status: rand(0..1), # 0 = activo, 1 = inactivo
          location_id: location.id
        )
      end
    end
  end
end

##############Users
3.times do |i|
  user = User.create!(
    email: "user#{i + 1}@evcharge.com",
    password: '123456',
    password_confirmation: '123456'
  )

################Vehicles for User
  rand(1..3).times do
    Vehicle.create!(
      name: "Vehicle #{rand(1..100)}",
      brand: ["Tesla", "Nissan", "BMW", "Ford", "Chevrolet"].sample,
      model: ["Model S", "Leaf", "X5", "Mustang", "Bolt"].sample,
      year: rand(2000..2023),
      user: user,
      status: rand(0..1) # 0 = activo, 1 = inactivo
    )
  end
end
