//
//  EmparejarTableViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth

class EmparejarTableViewController: UITableViewController, CBCentralManagerDelegate {
    static let emparejar = EmparejarTableViewController()

    @IBOutlet var tablaPolo: UITableView!
    @IBOutlet var tablaDemo: UITableView!
    @IBOutlet var tablaLlavero: UITableView!
    var peripheralBLE: CBPeripheral?

    var centralManager: CBCentralManager!
    var peripherals: Array<CBPeripheral> = Array<CBPeripheral>()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Initialise CoreBluetooth Central Manager
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
   
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        switch (central.state) {
        case .poweredOff:
            self.clearDevices()
            
        case .unauthorized:
            // Indicate to user that the iOS device does not support BLE.
            break
            
        case .unknown:
            // Wait for another event
            break
            
        case .poweredOn:
            self.startScanning()
            
        case .resetting:
            self.clearDevices()
            
        case .unsupported:
            break
        }
    }

    var bleService: BTService? {
        didSet {
            print("OMO 8")
            if let service = self.bleService {
                service.startDiscoveringServices()
                print("OMO 9")
            }
        }
    }

    func clearDevices() {
        self.bleService = nil
        //self.peripheralBLE = nil
    }
    
    func startScanning() {
        if let central = centralManager {
            central.scanForPeripherals(withServices: [BLEServiceUUID], options: nil)
        }
    }

    func stopScan() {
        centralManager.stopScan()
        tableView.reloadData()
        print("reload table view")
    }
    
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
            peripherals.append(peripheral)
               tableView.reloadData()
    }
    
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        peripheral.discoverServices(nil)
        // Create new service class
        if (peripheral == self.peripheralBLE) {
            self.bleService = BTService(initWithPeripheral: peripheral)
        }
        //UserDefaults.standard.set(peripheral, forKey: "dispo")

        print(peripheral.name!)
        print("\(peripheral.identifier)")

    }

    /////////////////////////////////////TABLE VIEW////////////////////////////////////////////////
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peripherals.count
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let peripheral = peripherals[indexPath.row]
      
        // Retain the peripheral before trying to connect
        self.peripheralBLE = peripheral
        
        // Reset service
        self.bleService = nil
        centralManager.connect(peripheral, options: nil)
        centralManager.stopScan()
        print(peripheral.name!)
        print("\(peripheral.identifier)")
        //guardando device en memoria
        beginApp()
    }
    ////////////////////////////////Ir hacia otro Activity//////////////////////////////////////

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
    
    
    
}
