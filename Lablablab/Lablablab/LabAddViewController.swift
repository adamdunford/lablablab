//


//   NOT SURE WE NEED THIS SEPARATE FROM OTHER LabEditViewController.swift, DO WE?

//




import UIKit

class LabAddViewController: UITableViewController {
    
    @IBOutlet weak var addBtn: UIBarButtonItem!
    @IBOutlet weak var newLab: UITextField!
    
    @IBOutlet var startTimePicker: UIDatePicker!
    @IBOutlet weak var startTime: UILabel!
    @IBOutlet var endTimePicker: UIDatePicker!
    @IBOutlet var locationPicker: UIPickerView!
    
    @IBOutlet var groupSize: UISegmentedControl!
    
    @IBAction func startTime(sender: UITextField) {
        
        let datePickerView : UIDatePicker = UIDatePicker()
        datePickerView.datePickerMode = UIDatePickerMode.Time
        sender.inputView = datePickerView
        datePickerView.addTarget(self, action: Selector("handleDatePicker:"), forControlEvents: UIControlEvents.ValueChanged)
        
    }
    func handleDatePicker(sender: UIDatePicker) {
        let timeFormatter = NSDateFormatter()
        timeFormatter.dateStyle = .NoStyle
        timeFormatter.timeStyle = .ShortStyle
        startTime.text = timeFormatter.stringFromDate(sender.date)
    }
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    
    
    var labDetail: Lab?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 3.0/255, green: 64.0/255, blue: 120.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)

        let attributes = [
            NSForegroundColorAttributeName: UIColor(red:255/255, green: 255/255, blue: 255/255, alpha: 0.5),
            NSFontAttributeName : UIFont(name: "Avenir", size: 21.0)!
        ]
        newLab.attributedPlaceholder = NSAttributedString(string: "Lab Name", attributes:attributes)
        
        
        
        // Do any additional setup after loading the view.
        addBtn.enabled = false
        
        self.newLab.addTarget(self, action: Selector("checkForTitle:"), forControlEvents: UIControlEvents.EditingChanged)
    }

    
    func checkForTitle(sender: UITextField) {
        if sender.text!.isEmpty {
            addBtn.enabled = false
        } else {
            addBtn.enabled = true
        }
    }
    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    // MARK: - Navigation

    @IBAction func cancelAdd(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }

    @IBAction func addLab(sender: UIBarButtonItem) {
        let name  = newLab.text
        let startTime = startTimePicker.date
        let endTime = endTimePicker.date
        let locationPosition = locationPicker.selectedRowInComponent(0)
        let studentsPerGroup = groupSize.selectedSegmentIndex + 2
        let userCalendar = NSCalendar.currentCalendar()
        let unitFlags: NSCalendarUnit = [.Hour, .Day, .Month, .Year]
        let lab = Lab(name: name!, studentsPerGroup: studentsPerGroup, location: Application.application.locations[locationPosition], instructor: Application.application.currentUser!,startTime:  userCalendar.components(unitFlags, fromDate: startTime),endTime:  userCalendar.components(unitFlags, fromDate: endTime))
        Application.application.labs.append(lab)
        navigationController?.popViewControllerAnimated(true)
        
    }

}
