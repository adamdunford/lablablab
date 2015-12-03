import Foundation

class Group {
    let members : [User]
    let number : Int
    
    init ( members : [User], number : Int) {
        self.members = members
        self.number = number
    }
    
}