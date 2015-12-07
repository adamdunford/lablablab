import Foundation

class Lab {
    var name : String
    var studentsPerGroup : Double
    var location : Location
    var instructor : User
    var date : NSDate
    var startTime : NSDate
    var endTime : NSDate
    var students : [User] = []
    var groups : [Group ] = []
    var questionQueue : QuestionQueue = QuestionQueue()
    
    
    init (name : String, studentsPerGroup : Int, location : Location, instructor : User, date : NSDate, startTime : NSDate, endTime : NSDate) {
        self.name = name
        self.studentsPerGroup = Double(studentsPerGroup)
        self.location = location
        self.instructor = instructor
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func generateGroups () {
        let groupCount : Int = Int(ceil(Double(students.count)/studentsPerGroup))
        let baseCountPerGroup : Int = Int(floor(Double(students.count)/studentsPerGroup))
        let remainingStudents = students.count - groupCount * baseCountPerGroup
        var currentlyAssigned = 0
        for var i = 0; i<groupCount; i++ {
            let extra = remainingStudents <= i+1 ? 1 : 0
            groups.append(Group(members: [User](students[currentlyAssigned...currentlyAssigned+baseCountPerGroup+extra]), number: i))
            currentlyAssigned += baseCountPerGroup+extra
        }
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
