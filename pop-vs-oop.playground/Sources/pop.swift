import Foundation

//class Vehicle {
//let name: String
//let numberOfWheels: Int
//let fuelTankSize: Int
//let fuelConsumption: Int

//class Tesla: Vehicle {
//let battery: Int // kWh
//let electricityConsumption: Int // kWh/100km

//class F150: Vehicle {
//	let truckBedSize = 6.5

//class Bike {
//	let name: String
//	let numberOfWheels: Int
//	let canEnterValley = true

protocol Branding {
	var name: String { get }
}

protocol LandVehicle {
	var numberOfWheels: Int { get }
}

protocol GasolineVehicle {
	var fuelTankSize: Int { get }
	var fuelConsumption: Int { get }
}

protocol ElectricVehicle {
	var battery: Int { get } // kWh
	var electricityConsumption: Int { get } // kWh/100km
}

protocol PickupTruck {
	var truckBedSize: Double { get }
}

protocol SmallVehicleAdvantage {
	var canEnterValley: Bool { get }
}

protocol Aircraft {
	var takeOffVelocity: Double { get }
}

class Honda: Branding, LandVehicle, GasolineVehicle {
	let name: String
	let numberOfWheels: Int = 4
	let fuelTankSize: Int
	let fuelConsumption: Int
	
	init(_ name: String, fuelTankSize: Int, fuelConsumption: Int) {
		self.name = name
		self.fuelTankSize = fuelTankSize
		self.fuelConsumption = fuelConsumption
	}
}

class F150: Branding, LandVehicle, GasolineVehicle, PickupTruck {
	let name: String
	let numberOfWheels: Int = 4
	let fuelTankSize: Int
	let fuelConsumption: Int
	let truckBedSize: Double

	
	init(_ name: String, fuelTankSize: Int, fuelConsumption: Int, truckBedSize: Double) {
		self.name = name
		self.fuelTankSize = fuelTankSize
		self.fuelConsumption = fuelConsumption
		self.truckBedSize = truckBedSize
	}
}

class Helicoptor: Branding, GasolineVehicle, Aircraft {
	let name: String
	let fuelTankSize: Int
	let fuelConsumption: Int
	let takeOffVelocity: Double
	
	init(_ name: String, fuelTankSize: Int, fuelConsumption: Int, takeOffVelocity: Double) {
		self.name = name
		self.fuelTankSize = fuelTankSize
		self.fuelConsumption = fuelConsumption
		self.takeOffVelocity = takeOffVelocity
	}
}

class Tesla: Branding, LandVehicle, ElectricVehicle {
	let name: String
	let numberOfWheels: Int = 4
	let battery: Int
	let electricityConsumption: Int
	
	
	init(_ name: String, battery: Int, electricityConsumption: Int) {
		self.name = name
		self.battery = battery
		self.electricityConsumption = electricityConsumption
	}
}

class Bike: Branding, LandVehicle, SmallVehicleAdvantage {
	let name: String
	let numberOfWheels: Int
	let canEnterValley: Bool
	
	init(_ name: String) {
		self.name = name
		self.numberOfWheels = 2
		self.canEnterValley = true
	}
}

