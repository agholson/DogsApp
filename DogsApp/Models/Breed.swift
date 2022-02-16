//
//  Breed.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//

import Foundation

struct Breed: Decodable, Identifiable {
    
    var id:UUID?
    var message: [String]?
    var status: String
    
}
