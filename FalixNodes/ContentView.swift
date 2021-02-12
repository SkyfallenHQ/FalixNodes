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
            ZStack(alignment: .bottom){
            List() {
                
                if currentPage == "Home" {
                
                Button(action: {
                    withAnimation {
                        currentPage = "Home"
                    }
                    
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
                    withAnimation{
                        currentPage = "Home"
                    }
                    
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
                    withAnimation{
                        currentPage = "GamePanel"
                    }
                    
                }){
                    
                    Text("Panel")
                        .foregroundColor(.white)
                        .padding([.leading,.trailing], 40)
                        .padding([.bottom,.top], 20)
                        .frame(width: 200, height: 40, alignment: .center)
                        .background(Color.gray)
                        .cornerRadius(12)
                    
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.top, 10)
                
                } else {
                    
                Button(action: {
                    withAnimation{
                        currentPage = "GamePanel"
                    }
                    
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
            VStack{
                Image(nsImage: NSImage(named:"AppIcon")!)
                    .resizable()
                    .frame(width: 150, height: 150)
                    .aspectRatio(contentMode: .fit)
                Text("FalixNodes App")
                    .font(.title)
                Text("SKYFALLEN")
                    .font(.subheadline)
                    .tracking(10)
                    .padding(.leading, 7)
                    .padding(.top, 10)
            }
            .padding(.bottom, 10)
        }
                            
                
                
        if currentPage == "Home" {
            ZStack(alignment: .bottomTrailing){
            homeEmbed
                .onAppear(perform: {
                    
                    if homeEmbedLoaded == false {
                        
                        homeEmbed.load(url: URL(string: "https://client.falixnodes.net/")!)
                        homeEmbedLoaded = true
                        
                    }
                    
                })
                if #available(OSX 11.0, *) {
                HStack{
                    Button(action: {
                        
                        homeEmbed.back()
                        
                    }) {
                        
                        
                            Image(systemName: "chevron.left.circle.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                        homeEmbed.reload()
                        
                    }) {
                        
                        
                            Image(systemName: "arrow.clockwise.circle.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                    Button(action: {
                        
                        homeEmbed.forward()
                        
                    }) {
                        
                        
                            Image(systemName: "chevron.right.circle.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 30))
                        
                        
                    }.buttonStyle(PlainButtonStyle())
                }
                .padding([.top,.bottom], 12)
                .padding([.leading,.trailing], 15)
                .background(Color(NSColor(red: 1, green: 1, blue: 1, alpha: 0.5)))
                .cornerRadius(12.0)
                .padding(.all, 15)
                
                }
            }
            
        }
        
        if currentPage == "GamePanel" {
            ZStack(alignment: .bottomTrailing){
            gpEmbed
                .onAppear(perform: {
                    
                    if gpEmbedLoaded == false {
                        
                        gpEmbed.load(url: URL(string: "https://gp.falixnodes.net/")!)
                        gpEmbedLoaded = true
                        
                    }
                    
                })
            if #available(OSX 11.0, *) {
                List(){
            HStack{
                Button(action: {
                    
                    gpEmbed.back()
                    
                }) {
                    
                    
                        Image(systemName: "chevron.left.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                    
                    
                }.buttonStyle(PlainButtonStyle())
                Button(action: {
                    
                    gpEmbed.reload()
                    
                }) {
                    
                    
                        Image(systemName: "arrow.clockwise.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                    
                    
                }.buttonStyle(PlainButtonStyle())
                Button(action: {
                    
                    gpEmbed.forward()
                    
                }) {
                    
                    
                        Image(systemName: "chevron.right.circle.fill")
                            .foregroundColor(.gray)
                            .font(.system(size: 30))
                    
                    
                }.buttonStyle(PlainButtonStyle())
            }
            
            }
                .cornerRadius(12.0)
                .frame(width: 150, height: 60, alignment: .center)
                .padding(.all, 15)
                .listStyle(SidebarListStyle())
            }
        }
            
        }
    }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
