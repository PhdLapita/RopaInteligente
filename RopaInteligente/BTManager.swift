//
//  BTManager.swift
//  RopaInteligente
//
//  Created by Gustavo Herminio Lapa Velásquez on 8/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth

let BLEServiceUUID = CBUUID(string: "713D0000-503E-4C75-BA94-3148F18D941E")
let characterTx = CBUUID(string: "713D0002-503E-4C75-BA94-3148F18D941E")
let characterRx = CBUUID(string: "713D0003-503E-4C75-BA94-3148F18D941E")
let BLEServiceChangedStatusNotification = "kBLEServiceChangedStatusNotification"

class BTManager: NSObject, CBCentralManagerDelegate, CBPeripheralDelegate {
    static let sharedInstance = BTManager()
    var periferico: CBPeripheral?
    var positionCharacteristic: CBCharacteristic?
    var centralManager: CBCentralManager?
    var ListaPerifericos: Array<CBPeripheral> = Array<CBPeripheral>()

    func getLista() -> Array<CBPeripheral> {
        return ListaPerifericos
    }
    /// Save the single instance
    static private var instance : BTManager {
        return sharedInstance
    }
    /**
     Singleton pattern method
     
     - returns: Bluetooth single instance
     */
    static func getInstance() -> BTManager {
        return instance
    }
    //////////////////////Descubriendo dispositivos///////////////////////
    
    override init() {
        super.init()
        //let centralQueue = DispatchQueue(label: "com.raywenderlich", attributes: [])
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
    
    func clearDevices() {
        //self.bleService = nil
        periferico = nil
    }

    func startScanning() {
        if let central = centralManager {
            central.scanForPeripherals(withServices: [BLEServiceUUID], options: nil)
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        ListaPerifericos.append(peripheral)
    }
    func centralManager(_ central: CBCentralManager, didConnect peripheral: CBPeripheral) {
        periferico = peripheral
        centralManager?.stopScan()
    }
    
    //////////////////////Usando el servicio del device////////////////////////////
}
