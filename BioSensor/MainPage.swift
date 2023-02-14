//
//  MainPage.swift
//  BioSensor
//
//  Created by Shi Xiang Lim on 2/7/23.
//

import Foundation
import SwiftUI

struct MainMenu: View {
    @Binding var tabSelection: Int
    @State var showingPopup = false
    
    var body: some View {
        ZStack{
            Color.teal.edgesIgnoringSafeArea([.top])
            VStack {
                Spacer()
                Text("APT BioSensor")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color.black)
                Spacer()
                
                Button(action: {
                    print("Pressed!")
                }){
                    Text("Start Measurement")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .multilineTextAlignment(.center)
                        .frame(width: UIScreen.main.bounds.width*3/4, height: UIScreen.main.bounds.width*3/4)
                        .background(RadialGradient(gradient: Gradient(colors: [.gray, .black]), center: .center, startRadius:UIScreen.main.bounds.width/3 , endRadius: UIScreen.main.bounds.width*3/8))
                        .clipShape(Circle())
                }.buttonStyle(PlainButtonStyle())
                
                Spacer()
                
                Button("Quick Start Guide"){
                    showingPopup = true
                }
                
                .font(.title2)
                .foregroundColor(.white)
                .underline()
                .onTapGesture {
                    self.tabSelection=4
                }
                .popover(isPresented: $showingPopup, arrowEdge: .bottom) {
                  QuickStartGuideView()
                    //Text("test")
                    //.frame(width: 100, height: 100)
                }
                Spacer()
            }
        }
    }
}
