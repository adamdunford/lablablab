import Foundation

class Application {
    
    var userPasswords: [String:String] = ["adam" : "Adampass", "fran" : "Franpass", "alma" : "Almapass", "olof": "Olofpass"]
    var userNames: [String:String] = ["adam" : "Adam", "fran" : "Fran", "alma" : "Alma", "olof": "Olof"]
    var userLastNames: [String:String] = ["adam" : "Dunford", "fran" : "Perkovic", "alma" : "Castillo", "olof": "Torgersson"]
    var userTypes: [String:Bool] = ["adam" : false, "fran" : false, "alma" : false, "olof": true]
    
    static var application : Application = Application(locations: [Location(name: "High"), Location(name: "Low"), Location(name: "Gamma"), Location(name: "Alpha"), Location(name: "Beta"), Location(name: "Delta"), Location(name: "Quark")])
    
    var currentUser : User?
    var locations : [Location] = []
    var labs : [Lab] = []
    
    init(locations : [Location]) {
        print("Initing")
        self.locations=locations
        
        let instructor = User(name: "Olof", lastName: "Torgersson", isInstructor: true)
        
        let lab1StartTime : NSDateComponents = NSDateComponents()
        lab1StartTime.hour = 15
        lab1StartTime.minute = 30
        lab1StartTime.day = 15
        lab1StartTime.month = 0
        lab1StartTime.year = 2016
        
        let lab1EndTime : NSDateComponents = NSDateComponents()
        lab1EndTime.hour = 17
        lab1EndTime.minute = 30
        lab1EndTime.day = 15
        lab1EndTime.month = 0
        lab1EndTime.year = 2016
        
        labs.append(Lab(name: "Android", studentsPerGroup: 4, location: locations[3], instructor: instructor, startTime: lab1StartTime, endTime: lab1EndTime))

        
        let lab2StartTime : NSDateComponents = NSDateComponents()
        lab2StartTime.hour = 11
        lab2StartTime.minute = 15
        lab2StartTime.day = 18
        lab2StartTime.month = 0
        lab2StartTime.year = 2016
        
        let lab2EndTime : NSDateComponents = NSDateComponents()
        lab2EndTime.hour = 13
        lab2EndTime.minute = 20
        lab2EndTime.day = 18
        lab2EndTime.month = 0
        lab2EndTime.year = 2016
        
        labs.append(Lab(name: "iOs", studentsPerGroup: 4, location: locations[1], instructor: instructor, startTime: lab2StartTime, endTime: lab2EndTime))
        
        let lab3StartTime : NSDateComponents = NSDateComponents()
        lab3StartTime.hour = 9
        lab3StartTime.minute = 15
        lab3StartTime.day = 13
        lab3StartTime.month = 0
        lab3StartTime.year = 2016
        
        let lab3EndTime : NSDateComponents = NSDateComponents()
        lab3EndTime.hour = 12
        lab3EndTime.minute = 0
        lab3EndTime.day = 13
        lab3EndTime.month = 0
        lab3EndTime.year = 2016
        
        labs.append(Lab(name: "Design", studentsPerGroup: 3, location: locations[2], instructor: instructor, startTime: lab3StartTime, endTime: lab3EndTime))
        
        //Add more labs if necessary
        print("End init")

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
    
    func test(){
        print("testing")
        let fran = User(name:"Fran", lastName: "Perkovic", isInstructor: false)
        fran.setLabs(labs)
        
        let alma = User(name:"Alma", lastName: "Castillo", isInstructor: false)
        alma.setLabs(labs)
        
        let adam = User(name:"Adam", lastName: "Dunford", isInstructor: false)
        adam.setLabs(labs)
        
        let kid1 = User(name:"Kid1", lastName: "Lastname", isInstructor: false)
        kid1.setLabs(labs)
        
        let kid2 = User(name:"Kid2", lastName: "Lastname", isInstructor: false)
        kid2.setLabs(labs)
        
        let kid3 = User(name:"Kid3", lastName: "Lastname", isInstructor: false)
        kid3.setLabs(labs)
        
        let kid4 = User(name:"Kid4", lastName: "Lastname", isInstructor: false)
        kid4.setLabs(labs)
        
        for lab in labs{
            lab.addStudent(fran)
            lab.addStudent(alma)
            lab.addStudent(adam)
            lab.addStudent(kid1)
            lab.addStudent(kid2)
            lab.addStudent(kid3)
            lab.addStudent(kid4)
            
            lab.generateGroups()
        }
        
        labs[0].addQuestion(labs[0].groups[0], location: Location(name: "High"))
        labs[0].addQuestion(labs[0].groups[1], location: Location(name: "Low"))
        labs[1].addQuestion(labs[1].groups[0], location: Location(name: "Alpha"))
        labs[1].addQuestion(labs[1].groups[1], location: Location(name: "Gamma"))
        labs[1].removeQuestion(labs[1].groups[1])
        
        print("fetching")
        labs[1].questionQueue.fetch()
    }
}
