import Foundation


class QuestionQueue {
    
    var groupsQueue : [Group ] = []
    var lab : String
    
    init(lab : String){
        self.lab = lab
        save()
    }
    
    func addGroup(group : Group) {
       groupsQueue.append(group)
        save()
    }
    
    func removeGroup(group : Group)  {
        if(groupsQueue.indexOf(group) != nil){
            groupsQueue.removeAtIndex(groupsQueue.indexOf(group)!)
        }
        
        save()
    }
    
    func save(){
        
        let predicate = NSPredicate(format: "lab = '\(self.lab)'")
        let query = PFQuery(className: "Queue", predicate: predicate)
        
        
        var queue =  PFObject(className: "Queue")
        
        do{
            let objects:[PFObject] = try query.findObjects()
            if objects.count != 0 {
                queue = objects[0]
                print("Found lab \(queue["lab"])")
            }else{
                print("No object found")
            }
            
            queue["lab"] = self.lab
            
            var groups = [String]()
            
            for g in self.groupsQueue{
                groups.append("\(g.number)")
            }
            
            
            queue["groups"] = groups.joinWithSeparator(",")
            
//            queue.saveInBackgroundWithBlock{
//                (suceeded: Bool, error : NSError?) -> Void  in
//                if suceeded {
//                    print("saved a queue")
//                }else{
//                    print(error!.userInfo)
//                }
//            }
            
            do{
                try queue.save()
            }catch{
                print("Error")
            }

        }catch{
            print("Error")
        }
        
        
//        query.findObjectsInBackgroundWithBlock({
//            (objects : [PFObject]?, error : NSError?) -> Void in
//            
//            if error == nil {
//                if objects!.count != 0 {
//                    queue = objects![0]
//                    print("Found lab \(queue["lab"])")
//                }else{
//                    print("No object found")
//                }
//                
//                queue["lab"] = self.lab
//                
//                var groups = [String]()
//                
//                for g in self.groupsQueue{
//                    groups.append("\(g.number)")
//                }
//                
//                
//                queue["groups"] = groups.joinWithSeparator(",")
//                
//                queue.saveInBackgroundWithBlock{
//                    (suceeded: Bool, error : NSError?) -> Void  in
//                    if suceeded {
//                        print("saved a queue")
//                    }else{
//                        print(error!.userInfo)
//                    }
//                }
//
//            }else{
//                print(error?.userInfo)
//            }
//        })
    }
    
}
