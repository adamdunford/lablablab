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
        //groupCount = ceil(students.count/studentsPerGroup)
        //baseCountPerGroup=floor(students.count/groupCount)
        //Create groupCount groups and add baseCountPerGroup students to each
        //Add remaining students to a group, one per group
    }
    
    func addStudent(student : User) {
        students.append(student)
    }
    
    func addQuestion(group : Group) {
        questionQueue.addGroup(group)
    }
    
}
