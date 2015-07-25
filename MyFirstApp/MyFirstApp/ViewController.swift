//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 我妻大輔 on 2015/07/25.
//  Copyright (c) 2015年 我妻大輔. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: UIButton!
    @IBOutlet weak var myLabel: UILabel!
    var myAnimater:UIDynamicAnimator?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        myLabel.text = "Hello, world!"
        myLabel.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapLabel(sender: UISwipeGestureRecognizer) {
        let gravity = UIGravityBehavior(items :[myLabel])
        myAnimater!.addBehavior(gravity)
        
        let collision = UICollisionBehavior(items: [myLabel, myButton])
        collision.translatesReferenceBoundsIntoBoundary = true
        myAnimater!.addBehavior(collision)
    
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        let animater = UIDynamicAnimator(referenceView: self.view)
        myAnimater = animater
    }
    
    
    @IBAction func tapButton(sender: AnyObject) {
        myLabel.hidden = !(myLabel.hidden)
    }

}

