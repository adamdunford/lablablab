import Foundation

import UIKit
import QuartzCore

let font = UIFont(name: "Avenir", size: 17.0)


extension UILabel {
    
    var substituteFontName : String {
        get { return self.font.fontName }
        set { self.font = font! }
    }
    
}



//extension UILabel {
//    
//    var substituteFontName : String {
//        get { return self.font.fontName }
//        set {
//            if self.font.fontName.rangeOfString("Medium") == nil {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//    
//    var substituteFontNameBold : String {
//        get { return self.font.fontName }
//        set {
//            if self.font.fontName.rangeOfString("Medium") != nil {
//                self.font = UIFont(name: newValue, size: self.font.pointSize)
//            }
//        }
//    }
//}


//extension UIView {
//    @IBInspectable var cornerRadius: CGFloat {
//        get {
//            return layer.cornerRadius
//        }
//        set {
//            layer.cornerRadius = newValue
//            layer.masksToBounds = newValue > 0
//        }
//    }
//    @IBInspectable var borderWidth: CGFloat = 0 {
//        didSet {
//            layer.borderWidth = borderWidth
//        }
//    }
//    @IBInspectable var borderColor: UIColor? {
//        didSet {
//            layer.borderColor = borderColor?.CGColor
//        }
//}

// crap, these are only applicable to Subclasses :-(
//@IBDesignable
//class MyCustomView: UIView {
//    ...
//}

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat {
        get {
            return self.layer.borderWidth
        }
        set {
            self.layer.borderWidth = newValue
        }
    }
    @IBInspectable var borderColor: UIColor {
        get {
            return UIColor(CGColor: self.layer.borderColor!)
        }
        set {
            self.layer.borderColor = newValue.CGColor
        }
    }
}

//set{ self.layer.borderColor = newValue.CGColor }
//get{ return UIColor(CGColor: self.layer.borderColor!) }
//
//@IBDesignable
//class UIExtender: UIView {
//    @IBInspectable var borderWidth: CGFloat {
//        get {
//            return self.layer.borderWidth
//        }
//        set {
//            self.layer.borderWidth = newValue
//        }
//    }
//    @IBInspectable var borderColor: UIColor? {
//        didSet {
//            layer.borderColor = borderColor?.CGColor
//        }
//    }
//}