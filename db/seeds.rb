property = FactoryBot.create(:property, title: 'Apartamento legal', bathrooms: 5,
                                   daily_rate: 200, pets: true)

property = FactoryBot.create(:property, title: 'Apartamento antigo', bathrooms: 2,
                                  daily_rate: 100, pets: false)