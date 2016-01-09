import Foundation

class Lab {
    var name : String
    var studentsPerGroup : Double
    var location : Location
    var instructor : User
    var startTime : NSDateComponents
    var endTime : NSDateComponents
    var students : [User] = []
    var groups : [Group ] = []
    var questionQueue : QuestionQueue
    
    
    init (name : String, studentsPerGroup : Int, location : Location, instructor : User, startTime : NSDateComponents, endTime : NSDateComponents) {
        self.name = name
        self.studentsPerGroup = Double(studentsPerGroup)
        self.location = location
        self.instructor = instructor
        self.startTime = startTime
        self.endTime = endTime
        self.questionQueue = QuestionQueue(lab : self.name)
    }
    
    func generateGroups () {
        print("generating groups")
        let groupCount : Int = Int(ceil(Double(students.count)/studentsPerGroup))
        let baseCountPerGroup : Int = Int(floor(Double(students.count)/Double(groupCount)))
        let remainingStudents = students.count - groupCount * baseCountPerGroup             
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
    func removeQuestion(group : Group){
        questionQueue.removeGroup(group)
    }
    
}
