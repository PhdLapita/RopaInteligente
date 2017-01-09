//
//  EmparejarTableViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth

class EmparejarTableViewController: UITableViewController {

    @IBOutlet var tablaPolo: UITableView!
    @IBOutlet var tablaDemo: UITableView!
    @IBOutlet var tablaLlavero: UITableView!
    let bluetoothManager = BTManager.getInstance()
    var lista: Array<CBPeripheral> = Array<CBPeripheral>()
    
    @IBAction func clicBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }
    @IBAction func clicRefresh(_ sender: UIBarButtonItem) {
        lista = bluetoothManager.getLista()
        tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        lista = bluetoothManager.getLista()
        tableView.reloadData()
    }

    /////////////////////////////////////BTDelegate Implementation u.u//////////////////////////////

    /////////////////////////////////////TABLE VIEW////////////////////////////////////////////////
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return lista.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = self.tableView.dequeueReusableCell(withIdentifier: "LabelCell")! as UITableViewCell
        
    
        //let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        //let fruitName = fruits[indexPath.row]
        
        let peripheral = lista[indexPath.row]
        cell.textLabel?.text = peripheral.name
        //cell.textLabel?.text = fruitName
        cell.detailTextLabel?.text = "\(peripheral.identifier)"

        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let peripheral = lista[indexPath.row]
      bluetoothManager.conectarDevice(periferal: peripheral)
     /*  // Retain the peripheral before trying to connect
        self.peripheralBLE = peripheral
        
        // Reset service
        self.bleService = nil
        centralManager.connect(peripheral, options: nil)
        centralManager.stopScan()
        print(peripheral.name!)
        print("\(peripheral.identifier)")*/
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
 
