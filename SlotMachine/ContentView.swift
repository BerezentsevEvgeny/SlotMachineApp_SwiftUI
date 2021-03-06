//
//  ContentView.swift
//  SlotMachine
//
//  Created by Евгений on 04.12.2020.
//

import SwiftUI

struct ContentView: View {
    
    @State private var numbers = [1, 2, 0]
    @State private var credits = 1000
    
    private var symbols = ["apple", "star", "cherry"]
    private var betAmount = 5
    
    var body: some View {
        ZStack {
            Rectangle().foregroundColor(Color(red: 200/255, green: 143/255, blue: 32/255))
                .edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            Rectangle()
                .foregroundColor(Color(red: 228/255, green: 195/255, blue: 76/255))
                .rotationEffect(Angle(degrees: 45)).edgesIgnoringSafeArea(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            
            VStack {
                Spacer()
                
                HStack {
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                    
                    Text("Slot machine")
                        .bold()
                        .foregroundColor(.white)
                    
                    Image(systemName: "star.fill").foregroundColor(.yellow)
                }.scaleEffect(2)
                
                Spacer()
                
                // Credits count
                Text("Credits" + String(credits))
                    .foregroundColor(.black)
                    .padding(.all,10)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                
                Spacer()
                
                // Cards
                HStack {
                    Spacer()
                    
                    Image(symbols[numbers[0]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                    Image(symbols[numbers[1]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                    Image(symbols[numbers[2]])
                    .resizable()
                    .aspectRatio(1, contentMode: .fit)
                    .background(Color.white.opacity(0.5))
                    .cornerRadius(20)
                    
                    Spacer()
                }
                
                Spacer()
                
                Button(action: {
                    
                    // Change images
                    self.numbers[0] = Int.random(in: 0...symbols.count - 1)
                    
                    self.numbers[1] = Int.random(in: 0...symbols.count - 1)
                    
                    self.numbers[2] = Int.random(in: 0...symbols.count - 1)
                    
                    //Check winnings
                    if self.numbers[0] == self.numbers[1] && self.numbers[1] == self.numbers[2] {
                        //Won
                        self.credits += self.betAmount * 10
                    } else {
                        self.credits -= self.betAmount
                    }
                    
                    
                }) {
                    Text("Spin")
                        .bold()
                        .foregroundColor(.white)
                        .padding(.all,10)
                        .padding([.leading,.trailing],30)
                        .background(Color.pink)
                        .cornerRadius(20)
                }
                
                Spacer()
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 11")
            
            
            
    }
}
