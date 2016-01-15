import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var logintext: UILabel!
    
    let gradient: CAGradientLayer = CAGradientLayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1)
        gradient.frame.size = self.view.frame.size
        gradient.colors = [UIColor(red: 18.0/255, green: 130.0/255, blue: 162.0/255, alpha: 1).CGColor,
            UIColor(red: 3.0/255, green: 64.0/255,  blue: 120.0/255, alpha: 1).CGColor,
            UIColor(red: 10.0/255, green: 17.0/255, blue: 40.0/255, alpha: 1).CGColor]
        self.view.layer.insertSublayer(gradient, atIndex: 0)
        
        let attributes = [
            NSForegroundColorAttributeName: UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 0.5),
            NSFontAttributeName : UIFont(name: "Avenir", size: 17.0)! // Note the !
        ]
        username.attributedPlaceholder = NSAttributedString(string: "Chalmers CID", attributes:attributes)
        password.attributedPlaceholder = NSAttributedString(string: "Password", attributes:attributes)
        
        logintext.font = UIFont(name: "Avenir", size: 14.0)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        let alert = UIAlertController(title: "Error", message: "Chalmers CID or password are incorrect", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        
        if username.text != nil && password.text != nil {
            if Application.application.login(username.text!, password: password.text!) {
                performSegueWithIdentifier("login", sender: self)
            } else {
                self.presentViewController(alert, animated: true, completion: nil)
            }
        } else {
            self.presentViewController(alert, animated: true, completion: nil)
        }
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
