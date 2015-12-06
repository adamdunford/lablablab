import Foundation


class QuestionQueue {
    
    var groupsQueue : [Group ] = []
    
    func addGroup(Group group) {
       groupsQueue.append(group)
    }
    
    func removeGroup(Group group)  {
        if(groupsQueue.indexOf(group)!=nil){
            groupsQueue.removeAtIndex(groupsQueue.indexOf(group)!)
        }
    }
    
    
}
