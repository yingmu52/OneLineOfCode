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
	var numberOfWheels: String { get }
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
