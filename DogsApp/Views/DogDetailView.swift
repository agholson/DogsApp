//
//  DogDetailView.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//

import SwiftUI

struct DogDetailView: View {
    
    var breed: Breed
    
    var body: some View {
        // Loop through the images, then load each of them
        ScrollView {
            LazyVStack {
                
                Text("The \(breed.name)")
                    .font(.headline)
                
                // MARK: Create Asynchronous Images
                // Process this differently if the imageUrlList does not contain anything
                if breed.imageUrlList == nil {
                    Image(systemName: "exclamationmark.icloud")
                }
                // Else it contains URLs, so load each of those
                else {
                    ForEach(breed.imageUrlList!, id: \.self) { imageUrl in
                        AsyncImage(url: URL(string: imageUrl)) { phase in
                            switch phase {
                            case .empty:
                                Color.purple.opacity(0.1)
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFit()
                            case .failure(_):
                                Image(systemName: "exclamationmark.icloud")
                                    .resizable()
                                    .scaledToFit()
                            @unknown default:
                                Image(systemName: "exclamationmark.icloud")
                            }
                        }
                    }
                }
            }
        }
    }
}

//struct DogDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//
//        let model = ContentModel()
//
//        DogDetailView(dog: model.dogs[0])
//
//    }
//}
