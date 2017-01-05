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
        setStatusBarBackgroundColor(color: #colorLiteral(red: 0.9019607843, green: 0.2901960784, blue: 0.09803921569, alpha: 1))
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func setStatusBarBackgroundColor(color: UIColor) {
        
        guard let statusBar = UIApplication.shared.value(forKeyPath: "statusBarWindow.statusBar") as? UIView else { return }
        
        statusBar.backgroundColor = color
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
    
    @IBAction func clicPoloInteligente(_ sender: UIButton) {
        UserDefaults.standard.setValue("1", forKey: "omo")
    }
    
    @IBAction func clicPoloDemo(_ sender: UIButton) {
        UserDefaults.standard.setValue("2", forKey: "omo")

    }
    
    @IBAction func clicLlavero(_ sender: UIButton) {
        UserDefaults.standard.setValue("3", forKey: "omo")
    }
    
    
    

}

