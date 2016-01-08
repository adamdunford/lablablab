import UIKit

class LabEditViewController: UITableViewController {

    @IBOutlet weak var labName: UITextField!

    @IBOutlet weak var startTime: UILabel!
    
    
    let gradient: CAGradientLayer = CAGradientLayer()
    
    
    var editLab: Lab? {
        didSet {
            self.configureView()
        }
    }
    
    func configureView() {
        if let editLab = self.editLab {
            if let labName = self.labName {
                labName.text = editLab.name
            }
        }
    }
    
//    func configureView() {
//        if let detail = self.labDetail {
//            if let labTitle = self.labTitle {
//                labTitle.text = detail.name
//            }
//            //need to figure out how to format these
//            //            if let labDate = self.labDate {
//            //                labDate.text = detail.date
//            //            }
//            //            if let labTitle = self.labTitle {
//            //                labTitle.text = detail.name
//            //              detail.startTime
//            //            detail.endTime
//            //            }
//            //            if let labSupervisor = self.labSupervisor {
//            //                labSupervisor.text = detail.instructor
//            //            }
//            //            if let labLocation = self.labLocation {
//            //                labLocation.text = detail.location
//            //            }
//            //            if let studentCount = self.studentCount {
//            //                studentCount.text = detail(students.count)
//            //            }
//        }
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 3.0/255, green: 64.0/255, blue: 120.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
    
    

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
        
//        let title: String? = editTitle.text
//        let author: String? = editAuthor.text
//        let price: Double? = Double(editPrice.text!)
//        let isbn: String? = editIsbn.text
//        let course: String? = editCourse.text
//        
//        if let book = editBook {
//            book.author = author!
//            book.title = title!
//            book.price = Double(price!)
//            book.isbn = isbn!
//            book.course = course!
//            SimpleBookManager.bookManager.saveChanges()
//            navigationController?.popViewControllerAnimated(true)
//        }
        
    }

}
