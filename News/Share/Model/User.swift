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
    let firstName, lastName: String
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
    
    
    static var mock: User {
        User(
            id: 123,
            firstName: "Benji",
            lastName: "Loya",
            age: 18,
            gender: "male",
            email: "apple.com",
            phone: "",
            username: "",
            password: "",
            birthDate: "",
            image: "",
            bloodGroup: "",
            height: 188,
            weight: 7,
            eyeColor: "",
            domain: "",
            ip: "",
            macAddress: "",
            university: "",
            ein: "",
            ssn: "",
            userAgent: ""
        )
    }
    
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
