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

class Honda: Branding, LandVehicle, GasolineVehicle, Racer {
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

class F150: Branding, LandVehicle, GasolineVehicle, PickupTruck, Racer {
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

class Helicoptor: Branding, GasolineVehicle, Aircraft, Racer {
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

class Tesla: Branding, LandVehicle, ElectricVehicle, Racer {
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

class Bike: Branding, LandVehicle, SmallVehicleAdvantage, Racer {
	let name: String
	let numberOfWheels: Int
	let canEnterValley: Bool
	
	init(_ name: String) {
		self.name = name
		self.numberOfWheels = 2
		self.canEnterValley = true
	}
}

protocol Racer: CustomStringConvertible {
//	var info: String { get }
	var longestTravelDistance: Int { get }
}

// the follwing means ----> class WhatEver: Racer, GasolineVehicle {

extension Racer where Self: GasolineVehicle {
	var longestTravelDistance: Int {
		return self.fuelTankSize / self.fuelConsumption * 100
	}
}

extension Racer where Self: ElectricVehicle {
	var longestTravelDistance: Int {
		return self.battery / self.electricityConsumption * 100
	}
}

extension Racer where Self: Branding & ElectricVehicle {
	var description: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km"
	}
}

extension Racer where Self: Branding & GasolineVehicle {
	var description: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km"
	}
}

extension Racer where Self: Branding & GasolineVehicle & PickupTruck {
	var description: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km, bed size: \(truckBedSize)\""
	}
}

extension Racer where Self: Branding & GasolineVehicle & SmallVehicleAdvantage {
	var description: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km, can enter valley: \(self.canEnterValley)"
	}
}

extension Racer where Self: LandVehicle & SmallVehicleAdvantage {
	var longestTravelDistance: Int {
		return 100
	}
}

extension Racer where Self: Branding & LandVehicle & SmallVehicleAdvantage {
	var description: String {
		return "\(self.name): can travel: \(self.longestTravelDistance) Km, can enter valley: \(self.canEnterValley)"
	}
}

let bike = Bike("Bycle")
let honda = Honda("Honda", fuelTankSize: 50, fuelConsumption: 6)
let f150XLT = F150("F150 XLT", fuelTankSize: 136, fuelConsumption: 13, truckBedSize: 6.5)
let helicopter = Helicoptor("Bell-429", fuelTankSize: 900 , fuelConsumption: 20, takeOffVelocity: 230)
let tesla = Tesla("Model-S", battery: 100, electricityConsumption: 20)
let rapters = F150("Raptors", fuelTankSize: 136, fuelConsumption: 17, truckBedSize: 5.5)

//print(bike)
//print(honda)
//print(f150XLT)
//print(helicopter)
//print(tesla)
//print(rapters)

// swift standard library

let racers: [Racer] = [honda, f150XLT, helicopter, tesla, rapters, bike]


func sort(racers: [Racer]) -> [Racer] {
	var result = racers
	result.sort { $0.longestTravelDistance < $1.longestTravelDistance }
	return result
}

let sortedRacers = sort(racers: racers)

extension Sequence where Element == Racer {
	func printRacers() {
		for racer in self {
			print(racer)
		}
	}
}

sortedRacers.printRacers()
