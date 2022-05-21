//
//  ContentView.swift
//  Card Game
//
//  Created by Aknar Assanov on 07.05.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State var playerCard = "back"
    @State var cpuCard = "back"
    @State var playerScore = 0
    @State var cpuScore = 0
    
    var body: some View {
        ZStack{
            Image("background")
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Image("logo")
                Spacer()
                HStack{
                    Spacer()
                    Image(playerCard)
                    Spacer()
                    Image(cpuCard)
                    Spacer()
                    
                }
                Spacer()
                
                Button(action: {
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    if playerRand > cpuRand {
                    playerScore += 1
                    }
                    else if playerRand < cpuRand{
                    cpuScore += 1
                    }
                    else {
                        playerScore += 0
                        cpuScore += 0
                    }
                }, label: {
                    Image("dealbutton")
                })

                Button {
                    
                    playerScore = 0
                    cpuScore = 0
                    playerCard = "back"
                    cpuCard = "back"
                } label: {
                    Text("Reset")
                        .padding(.all)
                        .padding(.horizontal, 40)
                        .foregroundColor(.white)
                        .background(Color(.systemBlue))
                        .cornerRadius(30)
                        .font(.system(size: 18, weight: .bold, design: .monospaced))
                }
                
                Spacer()
                HStack{
                    Spacer()
                    VStack{
                        Text("Player")
                            .font(.headline)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10.0)
                            
                        Text(String( playerScore))
                            .font(.largeTitle)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                    VStack{
                        Text("CPU")
                            .font(.headline)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                            .padding(.bottom, 10.0)
                        Text(String( cpuScore))
                            .font(.largeTitle)
                            .foregroundColor(/*@START_MENU_TOKEN@*/.white/*@END_MENU_TOKEN@*/)
                    }
                    Spacer()
                }
                Spacer()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
