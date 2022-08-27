//
//  mainView.swift
//  receipe list App
//
//  Created by Arthur Sh on 23.08.2022.
//

import SwiftUI

struct ReceipeTabview: View {
    var body: some View {
        TabView{
            Text("Featured View")
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            
            ReceipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        ReceipeTabview()
    }
}
