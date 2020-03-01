//
//  ContentView.swift
//  H4X0R News
//
//  Created by Areej on 3/1/20.
//  Copyright © 2020 Areej. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts) { post in
                NavigationLink(destination:  DetailView(url: post.url)) {
                    HStack{
                        Text("\(post.points)")
                        Text(post.title)
                    }
                }
            }
            .navigationBarTitle("H4X0R News")
        }
        .onAppear {
            self.networkManager.fatchData()
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}






