import UIKit

class LabDetailViewController: UIViewController {

    @IBOutlet weak var labName: UILabel!
    @IBOutlet weak var labDate: UILabel!
    @IBOutlet weak var labTime: UILabel!
    @IBOutlet weak var labSupervisor: UILabel!
    @IBOutlet weak var labLocation: UILabel!
    
    @IBOutlet weak var studentCount: UILabel!
    @IBOutlet weak var helpQueueCount: UILabel!
    
    
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    
    var labDetail: Lab? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        if let detail = self.labDetail {
            if let labName = self.labName {
                labName.text = detail.name
            }
 //need to figure out how to format these
//            if let labDate = self.labDate {
//                labDate.text = detail.date
//            }
//            if let labTitle = self.labTitle {
//                labTitle.text = detail.name
//              detail.startTime
//            detail.endTime
//            }
//            if let labSupervisor = self.labSupervisor {
//                labSupervisor.text = detail.instructor
//            }
//            if let labLocation = self.labLocation {
//                labLocation.text = detail.location
//            }
//            if let studentCount = self.studentCount {
//                studentCount.text = detail(students.count)
//            }
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "editLab" {
            let controller = segue.destinationViewController  as! LabEditViewController
            controller.editLab = self.labDetail
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 3.0/255, green: 64.0/255, blue: 120.0/255, alpha: 1)
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
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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