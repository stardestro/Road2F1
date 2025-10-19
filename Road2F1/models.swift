//
//  models.swift
//  Road2F1
//
//  Created by Hussain Alkatheri on 10/19/25.
//
import Foundation

struct Profile: Decodable, Encodable {
  let username: String?
  let fullName: String?
  let website: String?
  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
    case website
  }
}
struct UpdateProfileParams: Encodable {
  let username: String
  let fullName: String
  let website: String
  enum CodingKeys: String, CodingKey {
    case username
    case fullName = "full_name"
    case website
  }
}

struct User: Decodable, Encodable {
    let id: UUID
    let email: String
    let username: String
    let display_name: String
    var unlocked_cars: [UUID]
    let fastest_lap: Int?
    let total_races: Int
    let created_at: Date
    let updated_at: Date
}
