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
        loadLabs()
    }
    
    func loadLabs() {
        let instructor : User = isInstructor ? self : User(name: "Olof", lastName: "Torgersson", isInstructor: true)
        let lab1Date : NSDateComponents = NSDateComponents()
        lab1Date.day = 15
        lab1Date.month = 0
        lab1Date.year = 2016
        
        let lab1StartTime : NSDateComponents = NSDateComponents()
        lab1StartTime.hour = 15
        lab1StartTime.minute = 30
        
        let lab1EndTime : NSDateComponents = NSDateComponents()
        lab1EndTime.hour = 17
        lab1EndTime.minute = 30
        
        labs.append(Lab(name: "Android", studentsPerGroup: 4, location: Application.application.locations[3], instructor: instructor, date: lab1Date, startTime: lab1StartTime, endTime: lab1EndTime))
        
        let lab2Date : NSDateComponents = NSDateComponents()
        lab2Date.day = 18
        lab2Date.month = 0
        lab2Date.year = 2016
        
        let lab2StartTime : NSDateComponents = NSDateComponents()
        lab2StartTime.hour = 11
        lab2StartTime.minute = 15
        
        let lab2EndTime : NSDateComponents = NSDateComponents()
        lab2EndTime.hour = 13
        lab2EndTime.minute = 20
        
        labs.append(Lab(name: "iOs", studentsPerGroup: 4, location: Application.application.locations[1], instructor: instructor, date: lab2Date, startTime: lab2StartTime, endTime: lab2EndTime))
        
        let lab3Date : NSDateComponents = NSDateComponents()
        lab3Date.day = 13
        lab3Date.month = 0
        lab3Date.year = 2016
        
        let lab3StartTime : NSDateComponents = NSDateComponents()
        lab3StartTime.hour = 9
        lab3StartTime.minute = 15
        
        let lab3EndTime : NSDateComponents = NSDateComponents()
        lab3EndTime.hour = 12
        lab3EndTime.minute = 0
        
        labs.append(Lab(name: "Design", studentsPerGroup: 3, location: Application.application.locations[2], instructor: instructor, date: lab3Date, startTime: lab3StartTime, endTime: lab3EndTime))
        
        //Add more labs if necessary
    }
}
