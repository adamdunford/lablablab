import UIKit

class LabTableViewController: UITableViewController {
    
    var detailViewController: LabDetailViewController? = nil
    
    let gradient: CAGradientLayer = CAGradientLayer()

    
//    var labs : Lab = Lab
    var application : Application = Application.application
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.view.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        

        if Application.application.currentUser!.isInstructor {
            self.navigationItem.leftBarButtonItem = self.editButtonItem()
        } else {
            self.navigationItem.rightBarButtonItem = nil
        }
        
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
        if segue.identifier == "viewLabTeacher" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let lab = Application.application.labs[indexPath.row]
                let controller = segue.destinationViewController as! LabDetailViewController
                controller.labDetail = lab
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        } else if segue.identifier == "viewLabStudent" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let lab = Application.application.labs[indexPath.row]
                let controller = segue.destinationViewController as! LabDetailStudentViewController
                controller.labDetail = lab
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }else if segue.identifier == "addLab" {
            //let controller = segue.destinationViewController as! LabAddViewController

            // WHAT'S MISSING HERE??
            //            controller.labDetail = labDetail
        }
    }
    
    
    // MARK: - Table view

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Application.application.labs.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "LabCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath)
        let lab = Application.application.labs[indexPath.row]
        cell.textLabel!.text = lab.name
        let formatter = NSDateFormatter()
        formatter.dateFormat = " y-MM-dd - hh:mm"

        let userCalendar = NSCalendar.currentCalendar()

        cell.detailTextLabel!.text = "\(formatter.stringFromDate(userCalendar.dateFromComponents(lab.startTime)!))"

        cell.textLabel!.textColor = UIColor.whiteColor()
        cell.textLabel!.font = UIFont(name: "Avenir", size: 17.0)
        
        cell.detailTextLabel!.textColor = UIColor.whiteColor()
        cell.detailTextLabel!.font = UIFont(name: "Avenir", size: 11.0)
        
                let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        cell.selectedBackgroundView = backgroundView
        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return Application.application.currentUser!.isInstructor
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if Application.application.currentUser!.isInstructor {
            performSegueWithIdentifier("viewLabTeacher", sender: self)
        } else {
            performSegueWithIdentifier("viewLabStudent", sender: self)
        }
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            Application.application.labs.removeAtIndex(indexPath.row)
            //Do we want this to happen in the server too? Is it a priority?
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
}
