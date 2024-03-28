//
//  User.swift
//  News
//
//  Created by Benji Loya on 28.03.2024.
//

import Foundation

struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable, Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let gender, email, phone, username: String
    let password, birthDate: String
    let image: String
    let bloodGroup: String
    let height: Int
    let weight: Double
    let eyeColor: String
  //  let hair: Hair
    let domain, ip: String
 //   let address: Address
    let macAddress, university: String
  //  let bank: Bank
  //  let company: Company
    let ein, ssn, userAgent: String
  //  let crypto: Crypto
}

// MARK: - Address
struct Address: Codable {
    let address, city: String
    let coordinates: Coordinates
    let postalCode, state: String
}

// MARK: - Coordinates
struct Coordinates: Codable {
    let lat, lng: Double
}

// MARK: - Bank
struct Bank: Codable {
    let cardExpire, cardNumber, cardType, currency: String
    let iban: String
}

// MARK: - Company
struct Company: Codable {
    let address: Address
    let department, name, title: String
}

// MARK: - Crypto
struct Crypto: Codable {
    let coin, wallet, network: String
}

// MARK: - Hair
struct Hair: Codable {
    let color, type: String
}
