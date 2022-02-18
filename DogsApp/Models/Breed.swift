//
//  Breed.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//

import Foundation

/**
 Breed listed in the following  API: https://dog.ceo/api/breeds/list/all
 */
class Breed: Decodable, Identifiable {
//    var id = UUID()
    var name: String
    var imageUrlList: [String]?
    
    /**
     Gets a list of the URLs associated with images for the current breed
     Sample data from the following API: https://dog.ceo/api/breed/waterdog/images
     {
       "message":[
         "https:\/\/images.dog.ceo\/breeds\/waterdog-spanish\/20180706_194432.jpg",
          "https:\/\/images.dog.ceo\/breeds\/waterdog-spanish\/20180714_201544.jpg",
         "https:\/\/images.dog.ceo\/breeds\/waterdog-spanish\/20180723_185544.jpg","https:\/\/images.dog.ceo\/breeds\/waterdog-spanish\/20180723_185559.jpg","https:\/\/images.dog.ceo\/breeds\/waterdog-spanish\/20181023_072736.jpg","https:\/\/images.dog.ceo\/breeds\/waterdog-spanish\/20190208_063211.jpg"]
        ]
     "status":"success"
     
     }
     */
    func getBreedImageList() {
        // Construct the URL string for images for a specific breed based on its name
        // e.g. https://dog.ceo/api/breed/waterdog/images
        // https://dog.ceo/api/breed/waterdog/images
        let urlString = "\(Constants.baseApiUrl)/breed/\(self.name)/images"
        
        print(urlString)
        
        // Create the URL object based on the string
        let url = URL(string: urlString)
        
        
        // If the url is not nil, then proceed
        if let url = url {
            
            // Create a URL request to fetch data data from the API
            let request = URLRequest(url: url)
            
            // Get the shared singleton URLSession
            let session = URLSession.shared
            
            // Create a Data Task to issue the GET request
            let dataTask = session.dataTask(with: request) { data, response, error in
                // Ensure there are no errors
                if error == nil {
                    // Create a new decoder object to decode from the JSON into a struct
                    let decoder = JSONDecoder()
                    
                    // Make sure data contains content
                    if data != nil {
                        // Try to decode the JSON into a list of image URLs
                        do {
//                            print(data!)
                            let decodedResult = try decoder.decode(ImageSearch.self, from: data!)
                            
                            DispatchQueue.main.async {
                                // Grab the URL list from the message property
                                self.imageUrlList = decodedResult.message!
                                
//                                print("Image URL list line 70: \(self.imageUrlList)")
                                
                            }
                        }
                        catch {
                            print("Error line 80 in Breed: \(error)")
                        }
                    }
                    // Else it did not pull any image URLs
                    else {
                        print("Failed to pull any data from the API, on line 86 in Breed.")
                    }
                    
                }
                else {
                    print("Error occured in Breed, line 85. Failed to pull data from API. Full error: \(error!)")
                }
            }
            
            // Start the Data task
            dataTask.resume()
        }
        
    }
    
}

struct ImageSearch: Decodable {
    var message: [String]?
}



