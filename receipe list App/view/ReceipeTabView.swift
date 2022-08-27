//
//  mainView.swift
//  receipe list App
//
//  Created by Arthur Sh on 23.08.2022.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        TabView{
            
            
            RecipeFeaturedView()
                .tabItem {
                    VStack{
                        Image(systemName: "star.fill")
                        Text("Featured")
                    }
                }
            
            
            RecipeListView()
                .tabItem {
                    VStack{
                        Image(systemName: "list.bullet")
                        Text("List")
                    }
                }
        }
        .environmentObject(RecipeModel())

    }
}

struct mainView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
    }
}
