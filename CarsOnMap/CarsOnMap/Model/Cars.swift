//
//  Cars.swift
//  CarsOnMap
//
//  Created by Dhananjay Dubey on 17/9/21.
//

import Foundation

typealias Cars = [Car]

// MARK: - Car
struct Car: Codable {
    let id, modelIdentifier, modelName, name: String
    let color, series: String
    let carImageURL: String
    let fuelLevel: Double
    let licensePlate: String
    let latitude, longitude: Double
    let fuelType: FuelType
    let transmission: Transmission
    let innerCleanliness: InnerCleanliness
    let make, group: Group

    enum CodingKeys: String, CodingKey {
        case id, modelIdentifier, modelName, name, make, group,
             color, series, fuelType, fuelLevel, transmission,
             licensePlate, latitude, longitude, innerCleanliness
        case carImageURL = "carImageUrl"
    }
}

enum FuelType: String, Codable {
    case diesel = "D"
    case electric = "E"
    case petrol = "P"
}

enum Group: String, Codable {
    case bmw = "BMW"
    case mini = "MINI"
}

enum InnerCleanliness: String, Codable {
    case clean = "CLEAN"
    case regular = "REGULAR"
    case veryClean = "VERY_CLEAN"
}

enum Transmission: String, Codable {
    case automatic = "A"
    case manual = "M"
}
