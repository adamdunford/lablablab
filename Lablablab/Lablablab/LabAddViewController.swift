//


//   NOT SURE WE NEED THIS SEPARATE FROM OTHER LabEditViewController.swift, DO WE?

//




import UIKit

class LabAddViewController: UITableViewController {
    
    @IBOutlet weak var addBtn: UIBarButtonItem!
    @IBOutlet weak var newLab: UITextField!
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    
    
    var labDetail: Lab?
    
    override func viewDidLoad() {
        super.viewDidLoad()

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
        let name: String? = newLab.text

//  ADD CODE TO ADD LAB HERE
        
    }

}
