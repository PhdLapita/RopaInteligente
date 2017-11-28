//
//  ControldeVelocidadViewController.swift
//  RopaInteligente
//
//  Created by Bear on 4/10/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class ControldeVelocidadViewController: UIViewController {
 let bluetoothManager = BTManager.getInstance()
    @IBOutlet weak var txtVelocidad: UILabel!
    var velocidad: Int = 0
    var posicion: Int = 0
    var contador: Int = 0
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func clicSubir(_ sender: UIButton) {
        if velocidad == 100{
            
        }else{
             velocidad = velocidad+1
             bluetoothManager.writePosition("#\(velocidad)$")
            txtVelocidad.text = "\(velocidad)"
        }
    }
    @IBAction func clicBajar(_ sender: UIButton) {
        if velocidad == 0{
            
        }else{
            velocidad = velocidad-1
            bluetoothManager.writePosition("#\(velocidad)$")
            txtVelocidad.text = "\(velocidad)"
        }
    }
    @IBAction func clicReverse(_ sender: UIButton) {
        if contador == 0{
            bluetoothManager.writePosition("#d$")

        }else{
            bluetoothManager.writePosition("#i$")
        }
    }
    @IBAction func clicPlay(_ sender: UIButton) {
        bluetoothManager.writePosition("#\(velocidad)$")
        txtVelocidad.text = "\(velocidad)"
    }

    @IBAction func clicPause(_ sender: UIButton) {
        bluetoothManager.writePosition("#0$")
        txtVelocidad.text = "Pausa"
    }
    
    @IBAction func clicAtras(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        bluetoothManager.desconectando()
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
