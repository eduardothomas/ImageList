//
//  ContentView.swift
//  imageList
//
//  Created by Eduardo Thomas on 11/01/22.
//

import SwiftUI

//struct PicsumPhoto: Identifiable, Decodable {
//    var id: String
//    var author: String
//    var width: UInt16
//    var height: UInt16
//    var url: URL
//    var download_url: URL
//}

struct ContentView: View {
//    @State var images: [PicsumPhoto] = []
    
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
    
    //    func getImages() async throws -> [PicsumPhoto] {
    //        let request = URLRequest(url: URL(string: "https://picsum.photos/v2/list")!)
    //        let (data, response) = try await URLSession.shared.data(for: request)
    //
    //        guard(response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
    //
    //        let decodedImages = try JSONDecoder().decode([PicsumPhoto].self, from: data)
    //
    //        return decodedImages
    //    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension AsyncImage : Identifiable {
    public var id: UUID { UUID() }
}
