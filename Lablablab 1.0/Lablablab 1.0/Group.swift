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
        var group: CKRecord!
        
        group = CKRecord(recordType: "Group")
        
        group.setObject(self.number, forKey: "number")
        group.setObject(self.lab, forKey:"lab")
        
        var mems = [String]()
        for u in members{
            mems.append(u.name)
        }
        group.setObject(mems.joinWithSeparator(","), forKey: "members")
        
        let container = CKContainer.defaultContainer()
        let db = container.publicCloudDatabase
        
        db.saveRecord(group,completionHandler: { (record, error) -> Void in
            
            if(error != nil){
                print(error)
            }else{
                print("saved")
            }
        })
    }
}



func ==(group1: Group, group2: Group) -> Bool{
    return group1.number==group2.number;
}
