//
//  ContentView.swift
//  Tinder
//
//  Created by Jovan on 3/8/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import SwiftUI
import Firebase
import SDWebImageSwiftUI

struct HomeView: View {
    
   @EnvironmentObject var obs : observer
   @State var showLiked = false
        
        var body: some View {
           
            ZStack{
                
                Color("LightWhite").edgesIgnoringSafeArea(.all)

                if obs.users.isEmpty{
                    
                    Loader()
                }
                
                VStack{
                    
                    TopView(show: $showLiked)
                    
                    SwipeView()
                    
                    BottomView()
                }
                
            }.sheet(isPresented: $showLiked){
                
                LikedPeople()
            }
        }
    }
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
