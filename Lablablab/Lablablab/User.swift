import Foundation

class User {
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
