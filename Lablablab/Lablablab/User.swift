import Foundation

class User : Equatable{
    var name : String
    var lastName : String
    var isInstructor : Bool
    var labs: [Lab]
    
    
    init (name : String, lastName : String, isInstructor : Bool) {
        self.name = name
        self.lastName = lastName
        self.isInstructor = isInstructor
        self.labs = [Lab]()
    }
    
    func setLabs(labs:[Lab]){
        self.labs = labs
    }
    
}

func ==(lhs: User, rhs: User) -> Bool {
    return lhs.name==rhs.name && lhs.lastName==rhs.lastName
}
