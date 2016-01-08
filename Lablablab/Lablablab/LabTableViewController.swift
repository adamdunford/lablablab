import UIKit

class LabTableViewController: UITableViewController {
    
    var detailViewController: LabDetailViewController? = nil
    
    let gradient: CAGradientLayer = CAGradientLayer()

    
//    var labs : Lab = Lab
    var application : Application = Application.application
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
        
        self.view.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        
        
        //  TO-DO: 
        //  Add lab details
        
    }

    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
        super.viewWillAppear(animated)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    

    // MARK: - Segues
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            //this is one way
            //            let controller = segue.destinationViewController as! LabDetailViewController
            //            if let indexPath = tableView.indexPathForCell(sender as! UITableViewCell) {
            //                controller.labDetail = application.labs[indexPath.row]
            //            }
            //this is another way; both work
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let object = application.labs[indexPath.row]
                let controller = segue.destinationViewController as! LabDetailViewController
                controller.labDetail = object
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        } else if segue.identifier == "addLab" {
            let controller = segue.destinationViewController as! LabAddViewController

            // WHAT'S MISSING HERE??
            //            controller.labDetail = labDetail
        }
    }
    
    
    
    
    
    
    // MARK: - Table view

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        //  TO-DO:
        //  Add lab count
        //return labs.count() // this doesn't work, obviously
        return 0
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "LabCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)

        //  TO-DO:
        //  Add lab details & references
//        need to be able to reference some kind of "LabAtIndex(indexPath.row)}

//        cell.textLabel!.text = lab.name
//        cell.detailTextLabel!.text = lab.location // or date and time?
        
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            //  TO-DO:
            //  Allow labs to be deleted
            
            
            //bookManager.removeBook(bookManager.bookAtIndex(indexPath.row))
            //bookManager.saveChanges()
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}
