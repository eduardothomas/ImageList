//
//  ContentView.swift
//  imageList
//
//  Created by Eduardo Thomas on 11/01/22.
//

import SwiftUI

struct ContentView: View {
    @State var images: [AsyncImage<Image>] = []
    let baseURL = URL(string: "https://picsum.photos/450")!
    
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    VStack {
                        ForEach(images) { image in
                            image.scaledToFit().padding(.vertical, 7.0)
                        }
                    }
                }
            }
            .padding()
            .navigationBarTitle("Image List", displayMode: .automatic)
            .onAppear {
                images = generateImageURL()
            }
            .refreshable {
                images = generateImageURL()
            }
        }
    }
    
    func generateImageURL() -> [AsyncImage<Image>] {
        var images: [AsyncImage<Image>] = []
        for _ in 0..<10 {
            images.append(AsyncImage(url: baseURL))
        }
        return images
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AsyncImage : Identifiable {
    public var id: UUID { UUID() }
}
