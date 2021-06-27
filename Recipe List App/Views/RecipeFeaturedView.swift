//
//  RecipeFeaturedView.swift
//  Recipe List App
//
//  Created by Lucky Osunbiyi on 2021-06-17.
//

import SwiftUI

struct RecipeFeaturedView: View {
    
    @EnvironmentObject var model:RecipeModel
    @State var isDetailViewShowing = false
    @State var tabSelectionIndex = 0
  
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Text("Featured Recipes")
                .fontWeight(.bold)
                .padding(.leading)
                .padding(.top, 50)
                .padding(.bottom, -30)
                .font(.largeTitle)
            
            
            
            GeometryReader { geo in
                TabView(selection: $tabSelectionIndex) {
                    ForEach (0..<model.recipes.count) { index in
                        
                        if model.recipes[index].featured == true {
                            
                            
                            // Recipe Card Button
                            Button(action: {
                                
                                self.isDetailViewShowing = true
                                
                            }, label: {
                                
                                ZStack {
                                    Rectangle()
                                        .foregroundColor(.white)
                                    
                                    VStack(spacing: 0.0){
                                        Image(model.recipes[index].image)
                                            .resizable()
                                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                            .clipped()
                                        
                                        Text(model.recipes[index].name)
                                            .font(.headline)
                                            .padding(10)
                                    }
                                }
                                
                            }) .tag(index)
                            .sheet(isPresented: $isDetailViewShowing) {
                                RecipeDetailView(recipe: model.recipes[index])
                            }
                            .buttonStyle(PlainButtonStyle())
                            .frame(width: (geo.size.width - 40), height: (geo.size.height - 100), alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                            .cornerRadius(20)
                            .shadow(color: Color(.sRGB, red: 0, green: 0, blue: 0, opacity: 0.2), radius: 10, x: -5, y: 10)
                            
                            
                            //MARK: Recipe Card
                           
                            
                            
                            
                        }
                        
                        
                        
                    }
                } .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
                
            }
            
            
            VStack(alignment: .leading, spacing: 10.0) {
                Text("Prep Time")
                    .font(.headline)
                Text(model.recipes[tabSelectionIndex].prepTime)
                
                Text("Highlights")
                    .font(.headline)
                RecipeHighlights(highlights: model.recipes[tabSelectionIndex].highlights)
            } .padding(.leading)
            .padding(.bottom)
        } .onAppear(perform: {
                setFeaturedIndex()
        })
    }
    
    func setFeaturedIndex(){
        //find the index of first featured recipe
       var index = model.recipes.firstIndex { (recipe) -> Bool in
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

