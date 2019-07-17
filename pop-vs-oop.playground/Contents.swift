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
let f150 = Vehicle("F150 XLT", numberOfWheels: 4, fuelTankSize: 136, fuelConsumption: 13)

print(honda.info)
print(f150.info)

//let tesla = Vehicle("Tesla", numberOfWheels: 4, fuelTankSize: 0, fuelConsumption: 0) // yak!
let helicopter = Vehicle("Bell-429", numberOfWheels: 0, fuelTankSize: 900 , fuelConsumption: 20) // ???

//print(tesla.info) // error
print(helicopter.info)


class Tesla: Vehicle {
	let battery: Int // kWh
	let electricityConsumption: Int // kWh/100km
	
	init(_ name: String, battery: Int, electricityConsumption: Int) {
		self.battery = battery
		self.electricityConsumption = electricityConsumption
		super.init(name, numberOfWheels: 4, fuelTankSize: 0, fuelConsumption: 0) // yak!!
	}
	
	override var longestTravelDistance: Int {
		return self.battery / self.electricityConsumption * 100
	}
}

let tesla = Tesla("Model-S", battery: 100, electricityConsumption: 20)

print(tesla.info)

class F150: Vehicle {
	let truckBedSize = 6.5
	
	override var info: String {
		return "\(super.info), bed size: \(truckBedSize)\""
	}
}

let rapters = F150("Raptors", numberOfWheels: 4, fuelTankSize: 136, fuelConsumption: 17)
print(rapters.info)

class Bike {
	let name: String
	let numberOfWheels: Int
	let canEnterValley = true

	init(_ name: String, numberOfWheels: Int) {
		self.name = name
		self.numberOfWheels = 2
	}
	
	var info: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km, can enter valley: \(self.canEnterValley)"
	}
	
	let longestTravelDistance = 100 // km
}

let bike = Bike("Bycle", numberOfWheels: 2)
print(bike.info)

// End of OOP

// TODO: POP ??
