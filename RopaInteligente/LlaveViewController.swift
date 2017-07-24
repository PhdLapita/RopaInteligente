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
}
