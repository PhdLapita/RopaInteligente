//
//  LlaveViewController.swift
//  RopaInteligente
//
//  Created by Bear on 23/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class LlaveViewController: UIViewController {
    let bluetoothManager = BTManager.getInstance()

    @IBAction func clicAtras(_ sender: UIBarButtonItem) {
         self.dismiss(animated: true)
        bluetoothManager.desconectando()
    }
    @IBAction func clicLlavero(_ sender: UIButton) {
        bluetoothManager.writePosition("a")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
