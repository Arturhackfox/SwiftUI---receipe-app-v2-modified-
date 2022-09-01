//
//  ContentView.swift
//  receipe list App
//
//  Created by Arthur Sh on 15.08.2022.
//

import SwiftUI

struct RecipeListView: View {
    
    @EnvironmentObject var model:RecipeModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading){
                Text("All Recipes")
                    .bold()
                    .font(.largeTitle)
                    .padding(.top,40)
                
                ScrollView(){
                    
                    LazyVStack(alignment: .leading) {
                        ForEach(model.recipes) { r in
                            
                            NavigationLink(
                                destination: RecipeDetailView(receipe:r),
                                label: {
                                    
                                    // MARK: Row item
                                    HStack(spacing: 20.0) {
                                        Image(r.image)
                                            .resizable()
                                            .scaledToFill()
                                            .frame(width: 50, height: 50, alignment: .center)
                                            .clipped()
                                            .cornerRadius(5)
                                        VStack(alignment:.leading){
                                        Text(r.name)
                                            .foregroundColor(.black)
                                            .bold() 
                                            highlits(highlight: r.highlights)
                                                .foregroundColor(.black)
                                        }
                                    }
                                    
                                })
                            
                            
                        }
                    }
                }
            }
            .navigationBarHidden(true)
            .padding(.leading)
        }
    }
}
struct ReceipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(RecipeModel())
            .preferredColorScheme(.light)
    }
}
