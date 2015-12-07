import Foundation


class QuestionQueue {
    
    var groupsQueue : [Group ] = []
    
    func addGroup(group : Group) {
       groupsQueue.append(group)
    }
    
    func removeGroup(group : Group)  {
        if(groupsQueue.indexOf(group) != nil){
            groupsQueue.removeAtIndex(groupsQueue.indexOf(group)!)
        }
    }
    
}
