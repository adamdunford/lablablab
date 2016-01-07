//
//  ViewController.swift
//  Lablablab
//
//  Created by Adam Dunford on 12/3/15.
//  Copyright © 2015 CIU196 Mobile Computing. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        configureGradientBackground(UIColor.redColor().CGColor, UIColor.whiteColor().CGColor)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

func configureGradientBackground(colors:CGColorRef...){
    
    let gradient: CAGradientLayer = CAGradientLayer()
    let maxWidth = max(self.view.bounds.size.height,self.view.bounds.size.width)
    let squareFrame = CGRect(origin: self.view.bounds.origin, size: CGSizeMake(maxWidth, maxWidth))
    gradient.frame = squareFrame
    
    gradient.colors = colors
    view.layer.insertSublayer(gradient, atIndex: 0)
}


func addGradient(){
    
    let gradient:CAGradientLayer = CAGradientLayer()
    gradient.frame.size = self.viewThatHoldsGradient.frame.size
    gradient.colors = [UIColor.whiteColor().CGColor,UIColor.whiteColor().colorWithAlphaComponent(0).CGColor] //Or any colors
    self.viewThatHoldsGradient.layer.addSublayer(gradient)
    
}

var view: UIView = UIView(frame: CGRectMake(0.0, 0.0, 320.0, 50.0))
var gradient: CAGradientLayer = CAGradientLayer()
gradient.frame = view.bounds
gradient.colors = [UIColor.whiteColor().CGColor, UIColor.blackColor().CGColor]
view.layer.insertSublayer(gradient, atIndex: 0)



let gradientLayer = CAGradientLayer()
gradientLayer.frame = someView.bounds
gradientLayer.colors = [cgColorForRed(18.0, green: 130.0, blue: 162.0),
    cgColorForRed(3.0, green: 64.0, blue: 120.0),
    cgColorForRed(10.0, green: 17.0, blue: 40.0),
    cgColorForRed(51.0, green: 221.0, blue: 0.0),
    cgColorForRed(17.0, green: 51.0, blue: 204.0),
    cgColorForRed(34.0, green: 0.0, blue: 102.0),
    cgColorForRed(51.0, green: 0.0, blue: 68.0)]
gradientLayer.startPoint = CGPoint(x: 0, y: 0)
gradientLayer.endPoint = CGPoint(x: 0, y: 1)
someView.layer.addSublayer(gradientLayer)

func cgColorForRed(red: CGFloat, green: CGFloat, blue: CGFloat) -> AnyObject {
    return UIColor(red: red/255.0, green: green/255.0, blue: blue/255.0, alpha: 1.0).CGColor as AnyObject
}