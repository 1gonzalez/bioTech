//
//  ContentView.swift
//  APT2.0Test
//
//  Created by Juan on 2/6/23.
//

import SwiftUI
import CoreMotion

struct ContentView: View {
    
    let largeConfig = UIImage.SymbolConfiguration(pointSize: 140, weight: .bold, scale: .large)
    
    var body: some View {
        
        TabView {
            Group {
                DataView()
                    .tabItem {
                        Image(systemName: "chart.xyaxis.line")
                        Text("Data")
                    }
                
                MeasureView()
                    .tabItem {
                        Image(systemName: "bolt.heart")
                        Text("Measure")
                    }
                
                ProfileView()
                    .tabItem {
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
            .toolbar(.visible, for: .tabBar)
            .toolbarBackground(.red, for: .tabBar)
        }
    }
    
    
    struct ProfileView: View {
        
        var name: String = "Albert Gator"
        var username: String = "A.Gator352"
        var profileImage: Image = Image(systemName: "person.fill")
        
        var body: some View {
            ZStack {
                Color(red: 0.50, green: 0.82, blue: 0.96).edgesIgnoringSafeArea(.all)
                VStack{
                    VStack {
                        profileImage
                            .resizable()
                            .frame(width: 150, height: 150)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.white, lineWidth: 4))
                            .shadow(radius: 10)
                            .foregroundColor(.accentColor)
                        
                        Text(name)
                            .font(.title)
                            .bold()
                        
//                        Text(username)
//                            .font(.subheadline)
//                            .foregroundColor(.gray)
                        
                        Button(action: {
                            print("Reminders was tapped")
                        }) {
                            Text("REMINDERS")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18)
                                    .bold())
                                .padding()
                                .foregroundColor(.accentColor)
                                .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                        }
                        .cornerRadius(10)
                        .padding()
                        
                        Button(action: {
                            print("Resources was tapped")
                        }) {
                            Text("RESOURCES")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18)
                                    .bold())
                                .padding()
                                .foregroundColor(.accentColor)
                                .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                        }
                        .cornerRadius(10)
                        .padding()
                        
                        Button(action: {
                            print("About was tapped")
                        }) {
                            Text("ABOUT")
                                .frame(minWidth: 0, maxWidth: .infinity)
                                .font(.system(size: 18)
                                    .bold())
                                .padding()
                                .foregroundColor(.accentColor)
                                .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                        }
                        .cornerRadius(10)
                        .padding()
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 8)
                        .background(Color.white.opacity(0.2))
                }
            }
        }
    }
    
    struct DataView: View {
        var body: some View {
            ZStack {
                Color(red: 0.50, green: 0.82, blue: 0.96).edgesIgnoringSafeArea(.all)
                VStack {
                    Text("DATA VIEW")
                        .padding()
                        .frame(maxHeight: .infinity)
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 8)
                        .background(Color.white.opacity(0.2))
                }
                
            }
        }
    }
    
    
    struct MeasureView: View {
        
        @State private var isRecording = false
        @State private var tiltX: Double = 0.0
        @State private var tiltY: Double = 0.0
        @State private var tiltZ: Double = 0.0
        let motion = CMMotionManager()
        
        var body: some View {
            ZStack{
                Color(red: 0.50, green: 0.82, blue: 0.96).edgesIgnoringSafeArea(.all)
                
                VStack {
                    Button(action: {
                        self.isRecording.toggle()
                        if self.isRecording {
                            self.startRecording()
                        } else {
                            self.stopRecording()
                        }
                    }) {
                        Text("\(isRecording ? "Tap to" : "Tap to") Measure")
                            .font(.system(size: 60, weight: Font.Weight.bold))
                            .frame(width: 350, height: 350)
                            .foregroundColor(Color(red: 0.98, green: 0.69, blue: 0.27))
                            .background(Color(red: 0.82, green: 0.88, blue: 0.92))
                            .clipShape(Circle())
                            .shadow(radius: 20)
                        
                        
                    }
                    .padding()
                    .frame(maxHeight: .infinity)
                    
                    //Debug
//                    Text("Tilt X: \(tiltX, specifier: "%.2f")")
//                    Text("Tilt Y: \(tiltY, specifier: "%.2f")")
//                    Text("Tilt Z: \(tiltZ, specifier: "%.2f")")
                    
                    Rectangle()
                        .fill(Color.clear)
                        .frame(height: 8)
                        .background(Color.white.opacity(0.2))
                    
                }
                
                
            }
        }
        
        
        func startRecording() {
            if self.motion.isDeviceMotionAvailable {
                self.motion.deviceMotionUpdateInterval = 1.0 / 60.0
                self.motion.startDeviceMotionUpdates(to: .main) { (data, error) in
                    guard let data = data else { return }
                    self.tiltX = data.attitude.pitch
                    self.tiltY = data.attitude.roll
                    self.tiltZ = data.attitude.yaw
                }
            }
        }
        
        func stopRecording() {
            self.motion.stopDeviceMotionUpdates()
        }
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}
