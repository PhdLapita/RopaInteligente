//
//  EmparejarTableViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth
class EmparejarTableViewController: UITableViewController, CBCentralManagerDelegate, CBPeripheralDelegate {
    
    @IBOutlet var tablaPolo: UITableView!
    @IBOutlet var tablaDemo: UITableView!
    @IBOutlet var tablaLlavero: UITableView!
    
    var centralManager: CBCentralManager!
    var peripherals: Array<CBPeripheral> = Array<CBPeripheral>()
    
    
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialise CoreBluetooth Central Manager
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
   
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if (central.state == CBManagerState.poweredOn)
        {
            self.centralManager?.scanForPeripherals(withServices: nil, options: nil)
        }
        else
        {
            // do something like alert the user that ble is not on
        }
    }
    
    func stopScan() {
        centralManager.stopScan()
        tableView.reloadData()
        print("reload table view")
    }
    
    var a = 0
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            peripherals.append(peripheral)
               tableView.reloadData()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "LabelCell")! as UITableViewCell
        
    
        //let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        //let fruitName = fruits[indexPath.row]
        
        let peripheral = peripherals[indexPath.row]
        cell.textLabel?.text = peripheral.name
        //cell.textLabel?.text = fruitName
        cell.detailTextLabel?.text = "\(peripheral.identifier)"

        return cell
    }
    
    
    func beginApp(){
        let initActivity1 = self.storyboard?.instantiateViewController(withIdentifier: "polo")
        let initActivity2 = self.storyboard?.instantiateViewController(withIdentifier: "demo")
        let initActivity3 = self.storyboard?.instantiateViewController(withIdentifier: "llaveros")
        let seleccionado : String = UserDefaults.standard.string(forKey: "omo")!
        switch seleccionado {
        case "1":
            self.present(initActivity1!, animated: true, completion: nil)
        case "2":
            self.present(initActivity2!, animated: true, completion: nil)
        case "3":
            self.present(initActivity3!, animated: true, completion: nil)
        default :
            break
            }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let peripheral = peripherals[indexPath.row]
        centralManager.connect(peripheral, options: nil)
        centralManager.stopScan()
        print(peripheral.name!)
        print("\(peripheral.identifier)")
        //guardando device en memoria
        beginApp()
    }
    
    
    
}
