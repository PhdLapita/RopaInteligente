//
//  LucesViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth



class LucesViewController: UIViewController, CBPeripheralDelegate{
    let bluetoothManager = BTManager.getInstance()
   // var peripheral: CBPeripheral?
   // var btService: BTService?
    //var instanciaxD = EmparejarTableViewController.emparejar
    
    @IBOutlet weak var imgIroman: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //   peripheral = UserDefaults.standard.object(forKey: "dispo") as? CBPeripheral
      //  btService = BTService(initWithPeripheral: peripheral!)
        //bluetoothManager.conectarDevice(periferal: periferico!)
        //bluetoothManager.startDiscoveringServices()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }
    
    var a : Int = 0
    @IBAction func clicBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        }

    @IBAction func clicIroman(_ sender: UIButton) {
        if a == 0{
            imgIroman.image = #imageLiteral(resourceName: "iroman_color")
            a = 1
          //  btService?.writePosition("a")
            //instanciaxD.bleService?.writePosition("a")
            bluetoothManager.writePosition("a")
                print("OMO 6")
            
        }else{
            a=0
            imgIroman.image = #imageLiteral(resourceName: "iroman_incoloro")
        }
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
