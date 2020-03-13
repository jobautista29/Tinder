//
//  Cards.swift
//  Tinder
//
//  Created by Jovan on 3/8/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI
import Firebase

struct cards : View {
    
    var name = ""
    var image = ""
    var body : some View{
        
        HStack{
            
            AnimatedImage(url: URL(string: image)!).resizable().frame(width: 65, height: 65).clipShape(Circle())
            
            Text(name).fontWeight(.heavy)
        }
    }
}

class observer1 : ObservableObject{
    
    @Published var data = [datatype1]()
    
    init() {
        
        let db = Firestore.firestore()
        db.collection("liked").getDocuments { (snap, err) in
            
            if err != nil{
                
                print((err?.localizedDescription)!)
                return
            }
            
            for i in snap!.documents{
                
                let name = i.get("name") as! String
                let age = i.get("age") as! String
                let image = i.get("image") as! String
                
                self.data.append(datatype1(name: name, age: age, image: image, id: UUID().uuidString))
            }
        }
    }
}

struct datatype1 : Identifiable {
    
    var name : String
    var age : String
    var image : String
    var id  : String
}
