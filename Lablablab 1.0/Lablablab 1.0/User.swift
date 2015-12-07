import Foundation

class User {
    var name : String
    var lastName : String
    var isInstructor : Bool
    
    var labs : [Lab ] = []
    
    init (name : String, lastName : String, isInstructor : Bool) {
        self.name = name
        self.lastName = lastName
        self.isInstructor = isInstructor
    }
    
    func loadLabs() {
        //To do when we have the server
    }
    
}
