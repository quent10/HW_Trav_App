//
//  ContentView.swift
//  Travel_App
//
//  Created by Quentin Wingard on 10/18/23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedOption = 0
    let options = ["Stay Local", "Go Global"]
    
    @State private var isTextBoxExpanded = false
    @State private var isLiked = false
    
    var body: some View {
        VStack {
            Picker("Options", selection: $selectedOption) {
                ForEach(0 ..< options.count) { index in
                    Text(options[index])
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .frame(width: 200)
            .padding()
            
            ZStack(alignment: .bottom) {
                Image("gastronomie_Francaise")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
                
                if isTextBoxExpanded {
                    RoundedRectangle(cornerRadius: 20)
                        .foregroundColor(Color.black.opacity(0.7))
                        .frame(width: 300)
                        .overlay(
                            Text("Learn to make your own croissants!! The centrally located La Cuisine Paris cooking school has a range of culinary courses in English...")
                                .font(.title)
                                .foregroundColor(.white)
                                .padding()
                        )
                        .padding()
                }
                
                HStack {
                    Button(action: {
                        withAnimation {
                            isTextBoxExpanded.toggle()
                        }
                    }) {
                        Text("La Cuisine Paris: Dessert cooking class")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(10)
                    }
                    .padding()
                    .frame(width: 300.0)
                    
                    Button(action: {
                        isLiked.toggle()
                    }) {
                        ZStack {
                            Circle()
                                .fill(Color.black)
                                .frame(width: 40, height: 40)
                            
                            Image(systemName: isLiked ? "heart.fill" : "heart")
                                .foregroundColor(.white)
                            
                            
                        }
                    }
                    .padding()
                }
                VStack {
                    Image(systemName: "plus")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .offset(y: 20)
                }
                HStack {
                    Image(systemName: "house")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .offset(y: 20)
                        .offset(x: -100)
                    
                    Image(systemName: "bag")
                        .imageScale(.large)
                        .foregroundColor(.black)
                        .offset(y: 20)
                        .offset(x: 100)
                }
            }
            .padding()
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
