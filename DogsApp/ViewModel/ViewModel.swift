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
    
    init() {
        getDogs()
        getBreeds()
    }
    
    func getDogs(){
        
        // Create URL
        let urlString = Constants.apiUrl
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
                        print("Result line 43 ViewModel \(result)")
                        
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
    
    func getBreeds() {
        
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
                        let resultBreed = try decoder.decode(Breed.self, from: data!)
                        print("Breads line 84 \(resultBreed)")
                        
                        // Assign result to the dogs property
                        DispatchQueue.main.async {
                            self.breeds = [resultBreed]
                        }
                    // Check that there is not a parsing error
                    } catch {
                        print("Error in line 92 ViewModel \(error)")
                    }
                }
            }
            
            // Start the Data Task
            dataTask.resume()
        }
    }
}
