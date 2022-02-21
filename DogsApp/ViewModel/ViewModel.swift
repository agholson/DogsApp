//
//  ViewModel.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var dogs = Message()
    @Published var breeds = [Breed]()
    
    // New property to hold the list of URLs
    @Published var breedImageUrlList: [String]?
    
    // New property to hold dog
    @Published var currentBreed: Breed?
    
    init() {
        getDogs()
        getBreeds()
    }
    
    func getDogs(){
        
        // Create URL
        let urlString = Constants.breedsUrl
        let url = URL(string: urlString)
        
        if let url = url {
            // Create URL request
            var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
            request.httpMethod = "GET"
             
            // Get URLSession
            let session = URLSession.shared
            
            // Create Data Task
            let dataTask = session.dataTask(with: request) { (data, response, error) in
                // Check that there is not an error
                if error == nil {
                    
                    do {
                        // Parse JSON
                        let decoder = JSONDecoder()
                        let result = try decoder.decode(DogSearch.self, from: data!)
//                        print("Result line 43 ViewModel \(result)")
                        
                        // Assign result to the dogs property
                        DispatchQueue.main.async {
                            self.dogs = result.message
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
            
            // Start the Data Task
            dataTask.resume()
        }
    }
    
    /**
    Gets a list of breeds based on the dogs list/ the properties within the Message class, where each property represents a breed of dog. Each value for the breed of dog represents a
     specific type of breed of that dog. For example, key "terrier": [["american","australian","bedlington", "irish"] has all these types of terriers. For these, it makes the new breed name
     "irish terrier"
     
     From:
     https://dog.ceo/api/breeds/list/all
     
     */
    func getBreeds() {
        // Create a Mirror class of the Message object assigned to the dogs variable
        let mirror = Mirror(reflecting: dogs)
        
        // Create an empty list of Breeds to hold each of the breeds
        var breedList = [Breed]()
        
        let decoder = JSONDecoder()
        
        // Iterate through each of the Message properties
        for breedName in mirror.children {
            
            // Create an instance of temporary JSON to allow us to conform to the Codable protocol
            let tempJson = """
{
    "name": "\(breedName.label!)"
}
"""
            // Convert the string into JSON with UTF8
            let jsonData = tempJson.data(using: .utf8)!
            
            // Instantiate a new breed
            do {
                // Decode the breed
                let newBreed = try decoder.decode(Breed.self, from: jsonData)
                
                // Add the new breed to the list of breeds
                breedList.append(newBreed)
                
            }
            catch {
                print("Error occurred decoding JSON line 106 in ViewModel: \(error)")
            }
        }
        
        // Set the breeds property equal to this breeds list
        
        DispatchQueue.main.async {
            self.breeds = breedList
        }
        
    }
    
    // MARK: - New Method to Retrieve Breed/ Images
    func setCurrentBreed(breedName: String) {
        
        // Create an instance of temporary JSON to allow us to conform to the Codable protocol
        let tempJson = """
{
    "name": "\(breedName)"
}
"""
        // Convert the string into JSON with UTF8
        let jsonData = tempJson.data(using: .utf8)!
        let decoder = JSONDecoder()
        
        // Instantiate a new breed
        do {
            // Decode the breed
            var breed = try decoder.decode(Breed.self, from: jsonData)
            
            // MARK: - Get the list of images for this breed
            breed.getBreedImageList()
            
            DispatchQueue.main.async {
                // Update the current breed
                self.currentBreed = breed
                
            }
        
        }
        catch {
            print("Error occurred decoding JSON line 128 in ViewModel: \(error)")
        }
        
    }
}
