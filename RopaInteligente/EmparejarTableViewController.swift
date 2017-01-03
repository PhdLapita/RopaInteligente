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
    var centralManager: CBCentralManager!
    var peripheral: CBPeripheral!
    var fruits = ["Apple", "Apricot", "Banana", "Blueberry", "Cantaloupe", "Cherry",
                  "Clementine", "Coconut", "Cranberry", "Fig", "Grape", "Grapefruit",
                  "Kiwi fruit", "Lemon", "Lime", "Lychee", "Mandarine", "Mango",
                  "Melon", "Nectarine", "Olive", "Orange", "Papaya", "Peach",
                  "Pear", "Pineapple", "Raspberry", "Strawberry"]
    override func viewDidLoad() {
        super.viewDidLoad()
        self.startManager()
    }
    
    func startManager(){
        centralManager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fruits.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LabelCell", for: indexPath)
        let fruitName = fruits[indexPath.row]
        cell.textLabel?.text = fruitName
        cell.detailTextLabel?.text = "Delicious!"
        return cell
    }
}
