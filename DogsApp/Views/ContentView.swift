//
//  ContentView.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//
// Based on the question: https://codecrew.codewithchris.com/t/api-calls-customization/17463

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        VStack {
            
            // MARK: - Set Current Breed
            Button("See the waterdog") {
                // Set the current breed
                
                model.setCurrentBreed(breedName: "waterdog")
                
            }
            
            // MARK: - Navigate to the View for this breed
            // Only Show this, if the current breed is set
            if model.currentBreed != nil {
                NavigationView {
                    NavigationLink {
                        DogDetailView(breed: model.currentBreed!)
                    } label: {
                        Text("Check out more details about \(model.currentBreed!.name)")
                    }
                    
                }
            }
            
            
            //       DogDetailView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
