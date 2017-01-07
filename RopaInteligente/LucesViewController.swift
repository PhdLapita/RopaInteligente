//
//  LucesViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth
class LucesViewController: UIViewController, CBCentralManagerDelegate, CBPeripheralDelegate  {
    var manager: CBCentralManager?//中心角色
    var per: CBPeripheral?//服务
    var device: CBPeripheral!
    private let UuidSerialService = "6E400001-B5A3-F393-E0A9-E50E24DCCA9E"
    private let UuidTx =            "6E400002-B5A3-F393-E0A9-E50E24DCCA9E"
    private let UuidRx =            "6E400003-B5A3-F393-E0A9-E50E24DCCA9E"
    
    @IBOutlet weak var imgIroman: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //建立中心角色
        manager = CBCentralManager(delegate: self, queue: nil)
        print("hola")
        //device = (UserDefaults.standard.object(forKey: "device") as? CBPeripheral)
        //manager?.connect(device!, options: nil)
       // print("\(device?.name)")
        // Do any additional setup after loading the view.
        
    }
    var a : Int = 0
    @IBAction func clicBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        }

    @IBAction func clicIroman(_ sender: UIButton) {
        if a == 0{
            imgIroman.image = #imageLiteral(resourceName: "iroman_color")
            a = 1
        }else{
            a=0
            imgIroman.image = #imageLiteral(resourceName: "iroman_incoloro")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        
    }
    
    func peripheral(_ peripheral: CBPeripheral, didUpdateValueFor descriptor: CBDescriptor, error: Error?) {
        
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        if let central = manager {
            switch central.state {
            case .poweredOn:
                print("蓝牙已打开，请扫描外设")
                manager?.scanForPeripherals(withServices: nil, options: nil)
            case .poweredOff:
                print("蓝牙没有打开，请先打开蓝牙")
            default:
                break
            }
        }
    }
   
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
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
