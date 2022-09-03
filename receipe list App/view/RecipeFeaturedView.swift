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
    @State var tabSelectionIndex = 0
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 0){
            
            Text("Featured recipes")
                .bold()
                .font(Font.custom("Avenir Heavy", size: 24))
                .padding(.leading)
                .padding(.top, 40)
            
            
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex){
                    
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
                                            .font(Font.custom("Avenir", size: 15)) 
                                        
                                    }
                                }
                                
                            }
                            .tag(index )
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
                    .font(Font.custom("Avenir Heavy", size: 16))
                Text(model.recipes[tabSelectionIndex].prepTime)
                    .font(Font.custom("Avenir", size: 15))
                Text("Highlights:")
                    .font(Font.custom("Avenir Heavy", size: 16))
                highlits(highlight: model.recipes[tabSelectionIndex].highlights)
                    .font(Font.custom("Avenir", size: 15))
                
                
                
            }.padding([.leading, .bottom])
            
            
            
        }
        .onAppear(perform: setFeaturedindex)
        .padding(.leading)
    }
    
    func setFeaturedindex(){
        var index = model.recipes.firstIndex { recipe in
            return recipe.featured
        }
        tabSelectionIndex = index ?? 0
    }
    
}

struct RecipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeFeaturedView()
            .environmentObject(RecipeModel())
        
    }
}
