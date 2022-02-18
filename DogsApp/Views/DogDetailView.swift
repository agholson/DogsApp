//
//  DogDetailView.swift
//  DogsApp
//
//  Created by Leone on 2/15/22.
//

import SwiftUI

struct DogDetailView: View {
    
    @EnvironmentObject var model: ContentModel
    
//    var dog:  = model.dogs[0]
    
    var body: some View {
        Text("")
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
