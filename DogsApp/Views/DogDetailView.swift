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
                                .scaleEffect()
                        @unknown default:
                            Image(systemName: "exclamationmark.icloud")
                        }
                    }
//                    .frame(width: 200, height: 200)
                }
            }
        }
        //        VStack {
        //            List(0..<model.breeds.count, id: \.self) { index in
        //                ForEach(model.breeds[index].message!, id: \.self) { message in
        //                    AsyncImage(url: URL(string: "\(message)")) { phase in
        //                        switch phase {
        //                        case .empty:
        //                            Color.purple.opacity(0.1)
        //                        case .success(let image):
        //                            image
        //                                .resizable()
        //                                .scaledToFit()
        //                        case .failure(_):
        //                            Image(systemName: "exclamationmark.icloud")
        //                                .resizable()
        //                                .scaledToFit()
        //                        @unknown default:
        //                            Image(systemName: "exclamationmark.icloud")
        //                        }
        //                    }
        //                    .frame(width:300, height: 300)
        //                    .cornerRadius(20)
        //                }
        //            }
        //        }
        //        .navigationBarTitle("dog.name")
        //        .padding(.top, 0)
        //        .onAppear {
        //            print("Executed line 20")
        //        }
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
