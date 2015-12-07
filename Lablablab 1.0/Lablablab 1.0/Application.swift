import Foundation

class Application {
    var currentUser : User
    var locations : [Location]

    func init(user : User, locations : [Location]) {
       self.currentUser=user
       self.locations=locations
    }
}
