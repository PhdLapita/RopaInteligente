//
//  ViewController.swift
//  RopaInteligente
//
//  Created by Bear on 21/12/16.
//  Copyright © 2016 BearCreekMining. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var sidebar: NSLayoutConstraint!
    
    var menuShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func clicVerMas(_ sender: UIButton) {
        UIApplication.shared.openURL(NSURL(string: "http://www.bearcreekmining.com/s/Home.asp")! as URL)
    }
    
    @IBAction func clicMenu(_ sender: UIBarButtonItem) {
        
        if(menuShowing){
                    sidebar.constant = -200
        }else{
            sidebar.constant = 0
            UIView.animate(withDuration: 0.3, animations:{ self.view.layoutIfNeeded()})
            
        }
        menuShowing = !menuShowing

    }

}

