//
//  ContentView.swift
//  receipe list App
//
//  Created by Arthur Sh on 15.08.2022.
//

import SwiftUI

struct ReceipeListView: View {
    
   @ObservedObject var model = receipModel()
    
    var body: some View {
        
        NavigationView {
            List(model.recipes){ r in
                
                NavigationLink {
                    Receipe_detailView(receipe: r)
                } label: {
                    HStack(spacing: 20.0){
                        Image(r.image)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .clipped()
                            .cornerRadius(5)
                        Text(r.name)
                        
                    }
                }

                
                
            }.navigationTitle("All Recipes")
        }
    }
}

struct ReceipeListView_Previews: PreviewProvider {
    static var previews: some View {
        ReceipeListView()
            .preferredColorScheme(.dark)
    }
}
