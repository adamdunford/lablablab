import Foundation

class Group:Equatable {
    let members : [User]
    let number : Int
    
    init ( members : [User], number : Int) {
        self.members = members
        self.number = number
    }    
}

func ==(group1: Group, group2: Group) -> Group{
    return group1.number==group2.number;
}
