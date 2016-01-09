import Foundation


class QuestionQueue {
    
    var groupsQueue : [Group ] = []
    var locationsQueue : [Location ] = []
    var lab : String
    
    init(lab : String){
        self.lab = lab
        save()
    }
    
    func addGroup(group : Group, location: Location) {
        groupsQueue.append(group)
        locationsQueue.append(location)
        save()
    }
    
    func removeGroup(group : Group)  {
        if(groupsQueue.indexOf(group) != nil){
            locationsQueue.removeAtIndex(groupsQueue.indexOf(group)!)
            groupsQueue.removeAtIndex(groupsQueue.indexOf(group)!)
        }
        
        save()
    }
    
    func fetch(){
        let predicate = NSPredicate(format: "lab = '\(self.lab)'")
        let query = PFQuery(className: "Queue", predicate: predicate)
        
        var queue : [String] = []
        do{
            let objects:[PFObject] = try query.findObjects()
            if objects.count != 0 {
                queue = objects[0]["groups"].componentsSeparatedByString(",")
                print("Groups are:")
                for g in groupsQueue{
                    print(g.number)
                }
                groupsQueue = []
                locationsQueue = []
                
                for q in queue{
                    let pred = NSPredicate(format: "number = \(q) AND lab = '\(self.lab)'")
                    let que  = PFQuery(className: "Group", predicate: pred)
                    
                    let objs:[PFObject] = try que.findObjects()
                    
                    if objs.count != 0 {
                        for o in objs{
                            var mems : [User] = []
                            for m in (o["members"] as! String).componentsSeparatedByString(","){
                                mems.append(User(name: m,lastName:"lastname", isInstructor: false))
                            }
                            
                            groupsQueue.append(Group(members:mems,number:o["number"] as! Int, lab:self.lab))
                        }
                    }
                    print("Groups are after fetch:")

                    for g in groupsQueue{
                        print(g.number)
                    }
                }
                
                for l in (objects[0]["location"] as! String).componentsSeparatedByString(","){
                    locationsQueue.append(Location(name: l))
                }
                
                print("Locations are:")
                for l in locationsQueue{
                    print(l.name)
                }
            }else{
                print("No queue found")
            }
        }catch{
            print("Error")
        }
        
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
            
            var locations = [String]()
            
            for l in self.locationsQueue{
                locations.append("\(l.name)")
            }
            
            
            queue["location"] = locations.joinWithSeparator(",")

            
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
