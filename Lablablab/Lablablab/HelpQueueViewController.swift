import UIKit

class HelpQueueViewController: UITableViewController {


    var questionQueue: QuestionQueue?
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    
        UITableViewCell.appearance().textLabel?.textColor = UIColor.whiteColor()
        UITableViewCell.appearance().textLabel?.font = UIFont(name: "Avenir", size: 17.0)
        
        UITableViewCell.appearance().detailTextLabel?.textColor = UIColor.whiteColor()
        UITableViewCell.appearance().detailTextLabel?.font = UIFont(name: "Avenir", size: 11.0)
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return (questionQueue?.groupsQueue.count)!
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("GroupCell", forIndexPath: indexPath)
        cell.textLabel!.text = "Group \(questionQueue?.groupsQueue[indexPath.row].number) - \(questionQueue?.locationsQueue[indexPath.row].name)"
        cell.detailTextLabel!.text = questionQueue?.groupsQueue[indexPath.row].membersString()
        
        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.textLabel!.font = UIFont(name: "Avenir", size: 17.0)
        
        cell.detailTextLabel!.textColor = UIColor.whiteColor()
        cell.detailTextLabel!.font = UIFont(name: "Avenir", size: 11.0)
        
        //        cell.borderColor = UIColor.whiteColor()
        //        cell.borderWidth = 1.0
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        
        return cell
    }
    


    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

}
