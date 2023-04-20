//
//  ContentView.swift
//  udemy_17_Hacker_News
//
//  Created by Muslim on 13/04/23.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    

    var body: some View {
        NavigationView {

            List(networkManager.posts) { post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
            .listStyle(.grouped)
            .navigationTitle("News")
        }
        .onAppear() {
            self.networkManager.fetcData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts: [Post] = [
//    Post(id: "1", title: "Muslim"),
//    Post(id: "2", title: "Javohir"),
//    Post(id: "3", title: "Otabek"),
//    Post(id: "4", title: "Shuhrat"),
//    Post(id: "7", title: "Ilgor"),
//    Post(id: "5", title: "Qosim"),
//]
