//
//  ViewController.swift
//  Magic 8 Ball
//
//  Created by ram on 3/27/16.
//  Copyright © 2016 Ramteen Taheri. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var buttonOutlet: UIButton!
    
    @IBOutlet weak var tfOutlet: UITextField!
    @IBOutlet weak var textOutlet: UILabel!
    
    @IBOutlet weak var circleOutlet: UIImageView!
    
    var fileArray = ["images/circle1.png", "images/circle2.png", "images/circle3.png", "images/circle4.png", "images/circle5.png", "images/circle6.png"]
    
    var responseArray = ["Yes","No","Maybe","Perhaps"]
    var responseArray2 = ["Yes","No","Maybe","Perhaps",
    "reply hazy, try again"]
    
    var filename = "circle1.png"
    var rndnum = 0
    var rndnum2 = 0
    
    func textFieldShouldReturn(textField: UITextField) -> Bool
    {// called when 'return' key pressed. return NO to ignore.
        
        self.tfOutlet.resignFirstResponder()
        randomAnswer2()
        pickFile()
        textOutlet.alpha = 0
        circleOutlet.alpha = 0
        circleOutlet.image = UIImage(named: "\(filename)")
        
        textOutlet.text = responseArray2[rndnum]
        UIView.animateWithDuration(1.0, animations:{
            
            self.circleOutlet.alpha = 1.0
            self.textOutlet.alpha = 1.0
            
            })
        //textOutlet.alpha
        tfOutlet.text = ""
        return true
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
        super.touchesBegan(touches, withEvent: event)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.tfOutlet.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBAction func shakeButtonPressed(sender: AnyObject)
    {
        randomAnswer()
        textOutlet.text = responseArray[rndnum]
    }
    
    func randomAnswer()
    {
        rndnum = Int(arc4random_uniform(UInt32(responseArray.count)))
    }
    
    func randomAnswer2()
    {
        rndnum = Int(arc4random_uniform(UInt32(responseArray2.count)))
    }
    
    func pickFile()
    {
        rndnum2 = Int(arc4random_uniform(UInt32(fileArray.count)))
        filename = fileArray[rndnum2]
    }
    
    
    
}

