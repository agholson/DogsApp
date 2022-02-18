//
//  Constants.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//

import Foundation

// https://dog.ceo/api/breeds/list/all


/*
 Holds variables, so if the API changes, we only need to chang it here
 */
struct Constants {
    
    // Static variables allow us to reference these properties without initializing an object of the Constants struct
    static var breedsUrl = "https://dog.ceo/api/breeds/list/all"
    static var baseApiUrl = "https://dog.ceo/api"
    static var breedUrl = "https://dog.ceo/api/breed/waterdog/images"
    
    
}
