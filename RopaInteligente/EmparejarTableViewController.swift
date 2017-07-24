//
//  EmparejarTableViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth

class EmparejarTableViewController: UITableViewController,BTDelegate {

    let bluetoothManager = BTManager.getInstance()
    var lista: Array<CBPeripheral> = Array<CBPeripheral>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        bluetoothManager.delegate = self
        bluetoothManager.ListaPerifericos.removeAll()
        bluetoothManager.startScanning()
    }

    /////////////////////////////////////BTDelegate Implementation u.u//////////////////////////////
    func encontreUnDevicexD(_ lista: Array<CBPeripheral>){
        self.lista = lista
        tableView.reloadData()
    }
    
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
        //let initActivity1 = self.storyboard?.instantiateViewController(withIdentifier: "polo")
        let initActivity2 = self.storyboard?.instantiateViewController(withIdentifier: "polo")
        let initActivity3 = self.storyboard?.instantiateViewController(withIdentifier: "llavero2")
        let seleccionado : String = UserDefaults.standard.string(forKey: "omo")!//De accuerdo al boton presionado anteriormente se asigno un valor  a omo si es que se presiona el boton llavero, 1 para ropa inteligente y 2 para ropa inteligente sin coneccion
        switch seleccionado {
        /*case "1":
            self.present(initActivity1!, animated: true, completion: nil)*/
        case "2":
            self.present(initActivity2!, animated: true, completion: nil)
        case "3":
            self.present(initActivity3!, animated: true, completion: nil)
        default :
            break
            }
    }
}
 
