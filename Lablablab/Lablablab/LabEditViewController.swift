import UIKit

class LabEditViewController: UITableViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet var labName: UITextField!
    
    @IBOutlet var startTimePicker: UIDatePicker!
    
    @IBOutlet var endTimePicker: UIDatePicker!
    
    @IBOutlet var locationPicker: UIPickerView!
    
    @IBOutlet var autoCreateGroups: UISwitch!
    
    @IBOutlet var groupSize: UISegmentedControl!
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    
    var editLab: Lab? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        if let editLab = self.editLab {
            if let name = self.labName {
                name.text = editLab.name
            }
            let userCalendar = NSCalendar.currentCalendar()
            if let startTimePicker = self.startTimePicker {
                startTimePicker.date = userCalendar.dateFromComponents(editLab.startTime)!
            }
            if let endTimePicker = self.endTimePicker {
                endTimePicker.date = userCalendar.dateFromComponents(editLab.endTime)!
            }
            if let locationPicker = self.locationPicker {
                locationPicker.selectRow(Application.application.locations.indexOf({$0.name==editLab.location.name})!, inComponent: 0, animated: false)
            }
            if let autoCreateGroups = self.autoCreateGroups {
                autoCreateGroups.setOn(true, animated: false)
            }
            if let groupSizeControl = self.groupSize {
                groupSizeControl.selectedSegmentIndex = Int(editLab.studentsPerGroup) - 2
            }
            

        }
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return Application.application.locations.count;
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return Application.application.locations[row].name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 3.0/255, green: 64.0/255, blue: 120.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        self.locationPicker.dataSource = self
        self.locationPicker.delegate = self
    
        self.configureView()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation
    
    @IBAction func cancelEdit(sender: UIBarButtonItem) {
        navigationController!.popViewControllerAnimated(true)
    }
    
    @IBAction func updateLab(sender: UIBarButtonItem) {
        
        let name  = labName.text
        let startTime = startTimePicker.date
        let endTime = endTimePicker.date
        let locationPosition = locationPicker.selectedRowInComponent(0)
        let studentsPerGroup = groupSize.selectedSegmentIndex + 2
        
        if let lab = editLab {
            lab.name = name!
            let userCalendar = NSCalendar.currentCalendar()
            let unitFlags: NSCalendarUnit = [.Hour, .Day, .Month, .Year]
            lab.startTime = userCalendar.components(unitFlags, fromDate: startTime)
            lab.endTime = userCalendar.components(unitFlags, fromDate: endTime)
            lab.location = Application.application.locations[locationPosition]
            lab.studentsPerGroup = Double(studentsPerGroup)
        }
        navigationController?.popViewControllerAnimated(true)
    }

}
