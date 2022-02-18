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
        
        Button("See the waterdog") {
            // Set the current breed
            
            model.setCurrentBreed(breedName: "waterdog")
            
        }
      
//       DogDetailView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
