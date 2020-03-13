//
//  BottomView.swift
//  Tinder
//
//  Created by Jovan on 3/8/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import SwiftUI

struct BottomView: View {
    
@EnvironmentObject var obs : observer
    
    var body: some View {
        HStack {
            Button(action: {
            
                if self.obs.last != -1{
                    
                    self.obs.updateDB(id: self.obs.users[self.obs.last], status: "")
                }
            }) {
                Image("reload")            .resizable()
                    .frame(width:25, height:25)
            }.foregroundColor(Color.green)
                .shadow(radius: 25)
                .padding()
                .background(Color.white)
                .clipShape(Circle())
            
            Spacer()
            
            Button(action: {
                
             if self.obs.last == -1{
                    
                    //intial user...
                    self.obs.updateDB(id: self.obs.users[self.obs.users.count - 1], status: "reject")
                }
                else{
                    
                    // if last user index is 4 means current user index will be 4-1 = 3
                self.obs.updateDB(id: self.obs.users[self.obs.last - 1], status: "reject")
                    
                }
                
            }) {
                Image("clear")            .resizable()
                    .frame(width:40, height:40)
            }.foregroundColor(Color.pink)
            .shadow(radius: 25)
            .padding()
            .background(Color.white)
            .clipShape(Circle())
        
            
            Spacer()
            
            Button(action: {
            }) {
                Image("star")            .resizable()
                    .frame(width:30, height:30)
            }.foregroundColor(Color.yellow)
            .shadow(radius: 25)
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            
            Spacer()
            
            Button(action: {
                
            if self.obs.last == -1{
                    
                    //intial user...
                    self.obs.updateDB(id: self.obs.users[self.obs.users.count - 1], status: "liked")
                }
                else{
                    
                    // if last user index is 4 means current user index will be 4-1 = 3
                self.obs.updateDB(id: self.obs.users[self.obs.last - 1], status: "liked")
                    
                }
            }) {
                Image("heart")            .resizable()
                    .frame(width:45, height:40)
            }.foregroundColor(Color.blue)
            .shadow(radius: 25)
            .padding()
            .background(Color.white)
            .clipShape(Circle())
            
            Spacer()
            
            Button(action: {
            }) {
                Image("current")            .resizable()
                    .frame(width:35, height:35)
            }.foregroundColor(Color.purple)
            .shadow(radius: 25)
            .padding()
            .background(Color.white)
            .clipShape(Circle())
 
        }.padding()

    }
}

struct BottomView_Previews: PreviewProvider {
    static var previews: some View {
        BottomView()
    }
}
