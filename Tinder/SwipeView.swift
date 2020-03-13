//
//  SwipeView.swift
//  Tinder
//
//  Created by Jovan on 3/8/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct SwipeView: View {
    
@EnvironmentObject var obser : observer
        
    var body : some View{
            
        GeometryReader{geo in
            ZStack{
            ForEach(self.obser.users){i in
            SwipeDetailsView(name: i.name, age: i.age, image: i.image, height: geo.size.height - 100)       .gesture(DragGesture()
                        
                .onChanged({ (value) in
                                
                if value.translation.width > 0{
                                    
                    self.obser.update(id: i, value: value.translation.width, degree: 8)
                }
                else{
                                    
                    self.obser.update(id: i, value: value.translation.width, degree: -8)
                                }
                                
                }).onEnded({ (value) in
                                
                if i.swipe > 0{
                                    
                    if i.swipe > geo.size.width / 2 - 80{
                                        
                                        //liked
                        self.obser.update(id: i, value: 500, degree: 0)
                                    self.obser.updateDB(id: i, status: "liked")
                                        
                                    }
                                    else{
                                        
                                        self.obser.update(id: i, value: 0, degree: 0)
                                    }
                                }
                                else{
                                 
                                    if -i.swipe > geo.size.width / 2 - 80{
                                        
                                        // reject
                                    self.obser.update(id: i, value: -500, degree: 0)
                                    self.obser.updateDB(id: i, status: "reject")
                                        
                                    }
                                    else{
                                        
                                        self.obser.update(id: i, value: 0, degree: 0)
                                    }
                                }
                                
                            })
                        ).offset(x: i.swipe)
                        .rotationEffect(.init(degrees: i.degree))
                        .animation(.spring())
                        
                    }
                    
                }
            }
        }
    }

struct SwipeView_Previews: PreviewProvider {
    static var previews: some View {
        SwipeView()
    }
}
