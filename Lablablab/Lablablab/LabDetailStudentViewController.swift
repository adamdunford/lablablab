import UIKit

class LabDetailStudentViewController: UIViewController {
    
    @IBOutlet var labTitle: UILabel!
    @IBOutlet var labSupervisor: UILabel!
    @IBOutlet var labLocation: UILabel!
    @IBOutlet var labTime: UILabel!
    
    @IBOutlet var joinButton: UIButton!
    @IBOutlet var waitingLabel: UILabel!
    @IBOutlet var groupTable: UITableView! //We need to push data from the group members in here with some controller I image 
    //Data is in labDetails.groupForStudent(Application.application.currentUser).members
    //For each member I assume we need to show member.name and member.lastname
    @IBOutlet var askQuestionButton: UIButton!
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    var labDetail: Lab? {
        didSet {
            self.configureView()
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
        
        // Do any additional setup after loading the view.
        self.configureView()
        configureButtons()
    }
    
    override func viewWillAppear(animated: Bool) {
        configureButtons()
        super.viewWillAppear(animated)
    }
    
    func configureButtons() {
        if labDetail?.groups.count > 0 {
            joinButton.hidden = true
            waitingLabel.hidden = true
        } else {
            groupTable.hidden = true
            askQuestionButton.hidden = true
            if labDetail!.students.contains({$0 === Application.application.currentUser}) {
                joinButton.hidden = true
            } else {
                waitingLabel.hidden = true
            }
        }
    }
    
    func configureView() {
        if let detail = self.labDetail {
            if let title = self.labTitle {
                title.text = detail.name
            }
            
            let userCalendar = NSCalendar.currentCalendar()
            
            if let time = self.labTime {
                let formatter = NSDateFormatter()
                formatter.dateFormat = "y-MM-dd hh:mm"
                time.text = "\(formatter.stringFromDate(userCalendar.dateFromComponents(detail.startTime)!)) - \(formatter.stringFromDate(userCalendar.dateFromComponents(detail.endTime)!))"
            }
            
            if let labSupervisor = self.labSupervisor {
                labSupervisor.text = detail.instructor.name
            }
            if let labLocation = self.labLocation {
                labLocation.text = detail.location.name
            }

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func joinedLab(sender: AnyObject) {
        labDetail!.addStudent(Application.application.currentUser!)
        //Send this information to the server
        waitingLabel.hidden = false
        joinButton.hidden = true
    }
    
    @IBAction func askedQuestion(sender: AnyObject) {
        let group = labDetail!.groupForStudent(Application.application.currentUser!)
        labDetail?.addQuestion(group!,location:  Location(name: "High"))  //Change to actual location if there happens to be any in the UI
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
