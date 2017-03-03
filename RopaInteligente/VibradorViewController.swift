//
//  VibradorViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class VibradorViewController: UIViewController {

    @IBOutlet weak var btnUp: UIButton!
    @IBAction func clicBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    var a : Int = 0
    @IBAction func clicVibradorTop(_ sender: UIButton) {
        if a == 0{
            sender.setImage(#imageLiteral(resourceName: "seleccionar_accent"), for: .normal)
            a = 1
        }else{
            a = 0
             sender.setImage(#imageLiteral(resourceName: "seleccionar_negro"), for: .normal)
        }

    }
    var b : Int = 0
    @IBAction func clicVibradorBottom(_ sender: UIButton) {
        if b == 0{
            sender.setImage(#imageLiteral(resourceName: "seleccionar_accent"), for: .normal)
            b = 1
        }else{
            b = 0
            sender.setImage(#imageLiteral(resourceName: "seleccionar_negro"), for: .normal)        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
