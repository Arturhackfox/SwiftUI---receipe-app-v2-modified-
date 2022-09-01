//
//  RecipeFeaturedView.swift
//  receipe list App
//
//  Created by Arthur Sh on 27.08.2022.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured recipes")
                .bold()
                .font(.largeTitle)
                .padding(.leading)
                .padding(.top, 40)
            
            
            GeometryReader { geo in
                TabView{
                    
                    ForEach (0..<model.recipes.count, id: \.self){index in
                        
                        if model.recipes[index].featured == true {
                            
                            
                            Button {
                                self.isDetailViewShowing = true
                            } label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    VStack{
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .clipped()
                                        Text(model.recipes[index].name)
                                            .padding(5)
                                    }
                                }
                                
                            }
                            .sheet(isPresented: $isDetailViewShowing){
                                RecipeDetailView(receipe:  model.recipes[index])
                            }
                            .frame(width: geo.size.width - 40, height: geo.size.height - 100)
                                .cornerRadius(15)
                                .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.6), radius: 10, x: -5, y: 5)
                        }
                        
                    }
                    
                }
                .buttonStyle(PlainButtonStyle())
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                    .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            VStack(alignment: .leading, spacing: 10){
                Text("Preparation time:")
                    .font(.headline)
                Text("1 Hour")
                Text("Highlights:")
                    .font(.headline)
                Text("Healthy, Vegan")
                
                
                
            }.padding([.leading, .bottom])
            
            
            
        }.padding(.leading)
    }
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
        
    }
}
