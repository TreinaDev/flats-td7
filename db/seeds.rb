casa = PropertyType.create!(name: 'Casa')
Property.create!({ title: 'Casa com quintal em Copacabana', 
                  description: 'Excelente casa, recém reformada com 2 vagas de garagem',
                  rooms: 3, parking_slot: true, bathrooms: 2, daily_rate: 150,
                  property_type: casa
                })

apartamento = PropertyType.create!(name: 'Apartamento')
Property.create!({ title: 'Cobertura em Manaus', 
                  description: 'Cobertura de 300m2, churrasqueira e sauna privativa',
                  rooms: 5, parking_slot: false, bathrooms: 2, daily_rate: 150,
                  property_type: apartamento
                })