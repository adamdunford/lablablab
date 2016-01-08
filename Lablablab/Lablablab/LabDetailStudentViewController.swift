import UIKit

class LabDetailStudentViewController: UIViewController {
    
    @IBOutlet var labTitle: UILabel!
    @IBOutlet var labSupervisor: UILabel!
    @IBOutlet var labLocation: UILabel!
    @IBOutlet var labTime: UILabel!
    
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    var labDetail: Lab? {
        didSet {
            self.configureView()
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
        
        // Do any additional setup after loading the view.
        self.configureView()
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
                time.text = "\(formatter.stringFromDate(userCalendar.dateFromComponents(detail.startTime)!))"
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
    
    
    /*
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
    }
    */
    
}
