import Foundation

class Lab {
    var name : String
    var studentsPerGroup : Double
    var location : Location
    var instructor : User
    var date : NSDateComponents
    var startTime : NSDateComponents
    var endTime : NSDateComponents
    var students : [User] = []
    var groups : [Group ] = []
    var questionQueue : QuestionQueue = QuestionQueue()
    
    
    init (name : String, studentsPerGroup : Int, location : Location, instructor : User, date : NSDateComponents, startTime : NSDateComponents, endTime : NSDateComponents) {
        self.name = name
        self.studentsPerGroup = Double(studentsPerGroup)
        self.location = location
        self.instructor = instructor
        self.date = date
        self.startTime = startTime
        self.endTime = endTime
    }
    
    func generateGroups () {
        print("generating groups")
        let groupCount : Int = Int(ceil(Double(students.count)/studentsPerGroup))           //3
        let baseCountPerGroup : Int = Int(floor(Double(students.count)/Double(groupCount))) //2
        let remainingStudents = students.count - groupCount * baseCountPerGroup             //2
        var currentlyAssigned = 0
        for var i = 0; i<groupCount; i++ {
            let extra = remainingStudents >= i+1 ? 1 : 0
            groups.append(Group(members: [User](students[currentlyAssigned...currentlyAssigned+baseCountPerGroup-1+extra]), number: i, lab: self.name))
            currentlyAssigned += baseCountPerGroup+extra
        }
    }
    
    func addStudent(student : User) {
        students.append(student)
    }
    
    func addQuestion(group : Group) {
        questionQueue.addGroup(group)
    }
    
}
