import Foundation

class Vehicle {
	let name: String
	let numberOfWheels: Int
	let fuelTankSize: Int
	let fuelConsumption: Int
	
	init(_ name: String, numberOfWheels: Int, fuelTankSize: Int, fuelConsumption: Int) {
		self.name = name
		self.numberOfWheels = numberOfWheels
		self.fuelTankSize = fuelTankSize
		self.fuelConsumption = fuelConsumption
	}
	
	var info: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km"
	}
	
	var longestTravelDistance: Int {
		return self.fuelTankSize / self.fuelConsumption * 100
	}
}

let honda = Vehicle("Honda", numberOfWheels: 4, fuelTankSize: 50, fuelConsumption: 6)
let f150 = Vehicle("F150", numberOfWheels: 4, fuelTankSize: 136, fuelConsumption: 13)

print(honda.info)
print(f150.info)

let tesla = Vehicle("Tesla", numberOfWheels: 4, fuelTankSize: 0, fuelConsumption: 0) // yak!
let helicopter = Vehicle("Bell-429", numberOfWheels: 0, fuelTankSize: 900 , fuelConsumption: 20) // ???

//print(tesla.info) // error
print(helicopter.info)
