//
//  ContentView.swift
//  FalixNodes
//
//  Created by Yigit Kerem Oktay on 11.02.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentPage:String = "Home"
    @State private var homeEmbed: WebEmbed = WebEmbed()
    @State var homeEmbedLoaded: Bool = false
    @State private var gpEmbed: WebEmbed = WebEmbed()
    @State var gpEmbedLoaded: Bool = false
    
    var body: some View {
        HStack (spacing: 0){
            List() {
                
                if currentPage == "Home" {
                
                Button(action: {
                    
                    currentPage = "Home"
                    
                }){
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .padding([.leading,.trailing], 40)
                        .padding([.bottom,.top], 20)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color(NSColor(red: 0.39, green: 0.44, blue: 0.89, alpha: 1.00)))
                        .cornerRadius(12)
                    
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 10)
                
                } else {
                    
                Button(action: {
                    
                    currentPage = "Home"
                    
                }){
                    
                    Text("Home")
                        .foregroundColor(.white)
                        .padding([.leading,.trailing], 40)
                        .padding([.bottom,.top], 20)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color(NSColor.clear))
                        .cornerRadius(12)
                    
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 10)
                    
                }
                    
                if currentPage == "GamePanel" {
                
                Button(action: {
                    
                    currentPage = "GamePanel"
                    
                }){
                    
                    Text("Panel")
                        .foregroundColor(.white)
                        .padding([.leading,.trailing], 40)
                        .padding([.bottom,.top], 20)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color(NSColor(red: 0.39, green: 0.44, blue: 0.89, alpha: 1.00)))
                        .cornerRadius(12)
                    
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 10)
                
                } else {
                    
                Button(action: {
                    
                    currentPage = "GamePanel"
                    
                }){
                    
                    Text("Panel")
                        .foregroundColor(.white)
                        .padding([.leading,.trailing], 40)
                        .padding([.bottom,.top], 20)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color(NSColor.clear))
                        .cornerRadius(12)
                    
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 10)
                    
                }
                
                Spacer()
            }
            .listStyle(SidebarListStyle())
            .frame(width: 235)
                            
            
        if currentPage == "Home" {
            
            homeEmbed
                .onAppear(perform: {
                    
                    if homeEmbedLoaded == false {
                        
                        homeEmbed.load(url: URL(string: "https://client.falixnodes.net/")!)
                        homeEmbedLoaded = true
                        
                    }
                    
                })
            
        }
        
        if currentPage == "GamePanel" {
            
            gpEmbed
                .onAppear(perform: {
                    
                    if gpEmbedLoaded == false {
                        
                        gpEmbed.load(url: URL(string: "https://gp.falixnodes.net/")!)
                        gpEmbedLoaded = true
                        
                    }
                    
                })
            
        }
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
