import Foundation
import CloudKit

class Group:Equatable {
    let members : [User]
    let number : Int
    let lab : String
    
    init ( members : [User], number : Int, lab: String) {
        self.members = members
        self.number = number
        self.lab = lab

        save()
    }
    
    func save(){
// // Go to hell cloudkit!!!!
        
//        var group: CKRecord!
//        
//        group = CKRecord(recordType: "Group")
//        
//        group.setObject(self.number, forKey: "number")
//        group.setObject(self.lab, forKey:"lab")
//        
//        var mems = [String]()
//        for u in members{
//            mems.append(u.name)
//        }
//        group.setObject(mems.joinWithSeparator(","), forKey: "members")
//        
//        let container = CKContainer.defaultContainer()
//        let db = container.publicCloudDatabase
//        
//        db.saveRecord(group,completionHandler: { (record, error) -> Void in
//            
//            if(error != nil){
//                print(error)
//            }else{
//                print("saved")
//            }
//        })
//        
//        sleep(1)///icloud freaks out if too much requests
        
        var group =  PFObject(className: "Group")
        
        let predicate = NSPredicate(format: "number = \(self.number) AND lab = '\(self.lab)'")
        let query = PFQuery(className: "Group", predicate: predicate)

        do{
            let objects = try query.findObjects()
            if objects.count != 0 {
                group = objects[0]
            }
        }catch{
            print("Error")
        }
        
        group["number"] = self.number
        
        var mems = [String]()
        
        for u in members{
            mems.append(u.name)
        }
        
        
        group["members"] = mems.joinWithSeparator(",")
        group["lab"] = self.lab
        
//        group.saveInBackgroundWithBlock{
//            (suceeded: Bool, error : NSError?) -> Void  in
//            if suceeded {
//                print("saved")
//            }else{
//                print(error!.userInfo)
//            }
//        }
        
        do {
            try group.save()
        }catch {
            print("Error")
        }
        
        
        
    }
}



func ==(group1: Group, group2: Group) -> Bool{
    return group1.number==group2.number;
}
