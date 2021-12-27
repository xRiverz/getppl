//
//  User.swift
//  getppl
//
//  Created by admin on 27/12/2021.
//

import Foundation

struct People : Codable {
    let contacts : [Contact]
}

struct Contact : Codable {
    let name, birth_year : String
}
