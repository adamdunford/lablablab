import Foundation

class Lab {
    var name : String
    var studentsPerGroup : Int
    var location : Location
    var instructor : User
    var date : NSDate
    var startTime : NSDate
    var endTime : NSDate
    var students : [User ] = []
    var groups : [Group ] = []
    var questionQueue : QuestionQueue = QuestionQueue()
    
    
    init (name : String, studentsPerGroup : Int, location : Location, instructor : User, date : NSDate, startTime : NSDate, endTime : NSDate) {
        self.name = name
        self.studentsPerGroup = studentsPerGroup
        self.location = location
        self.instructor = instructor
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func generateGroups () {
        
    }
    
    func addStudent(student : User) {
        
    }
    
    func addQuestion(group : Group) {
        
    }
    
}