//
//  User.swift
//  CookIT
//
//  Created by Macbook on 11/11/2022.
//

import Foundation

struct User: Identifiable, Decodable {
    var id: Int
    var login: String
    var password: String
    var firstName: String
    var lastName: String
    var description: String
    var email: String
    var image: String
}
