import UIKit

class LabDetailViewController: UIViewController {

    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labDate: UILabel!
    @IBOutlet weak var labTime: UILabel!
    @IBOutlet weak var labSupervisor: UILabel!
    @IBOutlet weak var labLocation: UILabel!
    
    @IBOutlet weak var studentCount: UILabel!
    
    @IBOutlet var createGroupsButton: UIButton!
    
    @IBOutlet var viewQuestionQueueButton: UIButton!
    
    @IBOutlet var queueCountLabel: UILabel!
    let gradient: CAGradientLayer = CAGradientLayer()
    
    
    var labDetail: Lab? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        if let detail = self.labDetail {
            if let name = self.labName {
                name.text = detail.name
            }
            
            let userCalendar = NSCalendar.currentCalendar()
            
            if let date = self.labDate {
                let formatterDay = NSDateFormatter()
                formatterDay.dateFormat = "EEEE, d MMM yyyy"
                date.text = "\(formatterDay.stringFromDate(userCalendar.dateFromComponents(detail.startTime)!))"
            }
            if let time = self.labTime {
                let formatterTime = NSDateFormatter()
                formatterTime.dateFormat = "H:mm"
                time.text = "\(formatterTime.stringFromDate(userCalendar.dateFromComponents(detail.startTime)!)) - \(formatterTime.stringFromDate(userCalendar.dateFromComponents(detail.endTime)!))"
            }
            
            if let labSupervisor = self.labSupervisor {
                labSupervisor.text = detail.instructor.name
            }
            if let labLocation = self.labLocation {
                labLocation.text = detail.location.name
            }
            if let studentCount = self.studentCount {
                studentCount.text = "\(detail.students.count) in \(detail.groups.count) groups"
            }
            if let studentCount = self.studentCount {
                studentCount.text = "\(detail.students.count) in \(detail.groups.count) groups"
            }
            
            if detail.groups.count > 0 {
                queueCountLabel.text = "\(detail.questionQueue.groupsQueue.count) groups have questions"
            } else {
                if let queueCount = queueCountLabel {
                    queueCount.hidden = true
                }
                if let queueButton = viewQuestionQueueButton {
                    queueButton.hidden = true
                }
                
                
            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editLab" {
            let controller = segue.destinationViewController  as! LabEditViewController
            controller.editLab = self.labDetail
        } else if segue.identifier == "viewQuestionQueue" {
            let controller = segue.destinationViewController  as! HelpQueueViewController
            controller.questionQueue = self.labDetail?.questionQueue
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        //        gradient.frame = self.view.bounds
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        //        gradient.locations = [0.0, 0.5, 1.0]  // that's if we want to change where they appear
        self.view.layer.insertSublayer(gradient, atIndex: 0)

      
        labName.font = UIFont(name: "Avenir", size: 32.0)
        labDate.font = UIFont(name: "Avenir", size: 15.0)
        labTime.font = UIFont(name: "Avenir", size: 15.0)
        
        
        // Do any additional setup after loading the view.
        self.configureView()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        self.configureView()
    }
    
    @IBAction func generateGroupsPressed(sender: AnyObject) {
        labDetail?.generateGroups()
        createGroupsButton.hidden = true
        queueCountLabel.hidden = false
        queueCountLabel.text = "\(labDetail!.questionQueue.groupsQueue.count) groups have questions"
        viewQuestionQueueButton.hidden = false
        studentCount.text = "\(labDetail!.students.count) in \(labDetail!.groups.count) groups"
    }

    @IBAction func viewQuestionQueuePressed(sender: AnyObject) {
        performSegueWithIdentifier("viewQuestionQueue", sender: self)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}