//
//  LikePeople.swift
//  Tinder
//
//  Created by Jovan on 3/8/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct LikedPeople: View {
    
    @ObservedObject var datas = observer1()
    
    var body: some View {
         VStack{
        if datas.data.isEmpty{
            Text("No Liked People")
                    }
                    
        else{
            List(datas.data){i in
            cards(name: i.name, image: i.image)
                        }
                    }
                }

            }
        }

struct LikedPeople_Previews: PreviewProvider {
    static var previews: some View {
        LikedPeople()
    }
}
