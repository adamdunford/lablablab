import Foundation

class Application {
    
    var userPasswords: [String:String] = ["adam" : "Adampass", "fran" : "Franpass", "alma" : "Almapass", "olof": "Olofpass"]
    var userNames: [String:String] = ["adam" : "Adam", "fran" : "Fran", "alma" : "Alma", "olof": "Olof"]
    var userLastNames: [String:String] = ["adam" : "Dunford", "fran" : "Perkovic", "alma" : "Castillo", "olof": "Torgersson"]
    var userTypes: [String:Bool] = ["adam" : false, "fran" : false, "Alma" : false, "olof": true]
    
    static var application : Application = Application(locations: [Location(name: "High"), Location(name: "Low"), Location(name: "Gamma"), Location(name: "Alpha"), Location(name: "Beta"), Location(name: "Delta"), Location(name: "Quark")])
    
    var currentUser : User?
    var locations : [Location] = []
    
    init(locations : [Location]) {
        self.locations=locations
    }
    
    func login(id: String, password: String) -> Bool {
        if(userPasswords[id] == password){
            currentUser = User(name: userNames[id]!, lastName: userLastNames[id]!, isInstructor: userTypes[id]!)
            return true
        }
        return false
    }
    
    func logout (){
        currentUser = nil
    }
}
