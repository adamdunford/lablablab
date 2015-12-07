import Foundation

class Application {
    var currentUser : User
    var locations : [Location] = []

    init(currentUser : User, locations : [Location]) {
       self.currentUser=currentUser
       self.locations=locations
    }
}
