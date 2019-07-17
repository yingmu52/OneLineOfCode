import Foundation


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

struct Honda: Branding, LandVehicle, GasolineVehicle, Racer {
	let name: String
	let numberOfWheels: Int = 4
	let fuelTankSize: Int
	let fuelConsumption: Int
}

struct F150: Branding, LandVehicle, GasolineVehicle, PickupTruck, Racer {
	let name: String
	let numberOfWheels: Int = 4
	let fuelTankSize: Int
	let fuelConsumption: Int
	let truckBedSize: Double
}

struct Helicoptor: Branding, GasolineVehicle, Aircraft, Racer {
	let name: String
	let fuelTankSize: Int
	let fuelConsumption: Int
	let takeOffVelocity: Double
}

struct Tesla: Branding, LandVehicle, ElectricVehicle, Racer {
	let name: String
	let numberOfWheels: Int = 4
	let battery: Int
	let electricityConsumption: Int
}

struct Bike: Branding, LandVehicle, SmallVehicleAdvantage, Racer {
	let name: String
	let numberOfWheels: Int = 2
	let canEnterValley: Bool = true
}

protocol Racer: CustomStringConvertible {
//	var info: String { get }
	var longestTravelDistance: Int { get }
}

// the follwing means ----> struct WhatEver: Racer, GasolineVehicle {

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

let bike = Bike(name: "Bycle")
let honda = Honda(name: "Honda", fuelTankSize: 50, fuelConsumption: 6)
let f150XLT = F150(name: "F150 XLT", fuelTankSize: 136, fuelConsumption: 13, truckBedSize: 6.5)
let helicopter = Helicoptor(name: "Bell-429", fuelTankSize: 900 , fuelConsumption: 20, takeOffVelocity: 230)
let tesla = Tesla(name: "Model-S", battery: 100, electricityConsumption: 20)
let rapters = F150(name: "Raptors", fuelTankSize: 136, fuelConsumption: 17, truckBedSize: 5.5)

extension Sequence where Element == Racer {
	func printRacers() {
		for racer in self {
			print(racer)
		}
	}
	
	func sortedRacers() -> [Racer] {
		return self.sorted { $0.longestTravelDistance < $1.longestTravelDistance }
	}
}

let racers: [Racer] = [honda, f150XLT, helicopter, tesla, rapters, bike]
let sortedRacers = racers.sortedRacers()
sortedRacers.printRacers()
