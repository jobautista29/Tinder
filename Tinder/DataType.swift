//
//  DataType.swift
//  Tinder
//
//  Created by Jovan on 3/8/20.
//  Copyright © 2020 Jovan. All rights reserved.
//

import Foundation
import Firebase

class observer: ObservableObject{
    
    @Published var users = [dataType]()
    
    @Published var last = -1
    
    init(){
        let db = Firestore.firestore()
        
        db.collection("users").getDocuments {(snap, err) in
        
        if err != nil{
            print((err?.localizedDescription)!)
            return
        }
        
        for i in snap!.documents{
            let name = i.get("name") as! String
            let age = i.get("age") as! String
            let image = i.get("image") as! String
            let id = i.documentID
            let status = i.get("status") as! String
            
            if status == ""{
            
            self.users.append(dataType(id: id, name: name, image: image, age: age, swipe: 0, degree: 0))
            }
        }
    }
}
    func update(id : dataType,value : CGFloat,degree : Double){
            
            for i in 0..<self.users.count{
                
                if self.users[i].id == id.id{
                    
                    self.users[i].swipe = value
                    self.users[i].degree = degree
                    self.last = i
                }
            }
        }

        
        func updateDB(id : dataType,status : String){
            
            let db = Firestore.firestore()
            
            db.collection("users").document(id.id).updateData(["status":status]) { (err) in
                
                if err != nil{
                    
                    print(err!.localizedDescription)
                    return
                }
                
                print("success")
                
                for i in 0..<self.users.count{
                    
                    if self.users[i].id == id.id{
                        
                        if status == "liked"{
                            
                            self.users[i].swipe = 500
                        }
                        else if status == "reject"{
                            
                            self.users[i].swipe = -500
                        }
                        else{
                            
                            self.users[i].swipe = 0
                        }
                    }
                }
                
                if status == "liked"{
                    
                    db.collection("liked").document(id.id).setData(["name":id.name,"age":id.age,"image":id.image]) { (err) in
                        
                        if err != nil{
                            
                            print((err?.localizedDescription)!)
                            return
                        }
                    }
                }
                
                if status == ""{
                    
                    db.collection("liked").document(id.id).delete { (err) in
                        
                        if err != nil{
                            
                            print((err?.localizedDescription)!)
                            return
                        }
                    }
                }
                
            }
        }
        
    }

struct dataType: Identifiable {
    
    var id: String
    var name: String
    var image: String
    var age: String
    var swipe: CGFloat
    var degree: Double
    
}
