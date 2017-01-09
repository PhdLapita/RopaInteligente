//
//  BTService.swift
//  RopaInteligente
//
//  Created by Gustavo Herminio Lapa Velásquez on 7/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import CoreBluetooth




class BTService: NSObject, CBPeripheralDelegate {
    
    var peripheral: CBPeripheral?
    var positionCharacteristic: CBCharacteristic?
    
    
    init(initWithPeripheral peripheral: CBPeripheral) {
        super.init()
        
        self.peripheral = peripheral
        self.peripheral?.delegate = self
    }
    
    deinit {
        self.reset()
    }
    
    func startDiscoveringServices() {
        self.peripheral?.discoverServices([BLEServiceUUID])
    }
    
    func reset() {
        if peripheral != nil {
            peripheral = nil
        }
        
        // Deallocating therefore send notification
        self.sendBTServiceNotificationWithIsBluetoothConnected(false)
    }
    
    // Mark: - CBPeripheralDelegate
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverServices error: Error?) {
        let uuidsForBTService: [CBUUID] = [characterRx]
        
        if (peripheral != self.peripheral) {
            // Wrong Peripheral
            return
        }
        
        if (error != nil) {
            return
        }
        
        if ((peripheral.services == nil) || (peripheral.services!.count == 0)) {
            // No Services
            return
        }
        
        for service in peripheral.services! {
            print(service)
            print("LOL")
            if service.uuid == BLEServiceUUID {
                peripheral.discoverCharacteristics(uuidsForBTService, for: service)
            }
        }
        print("OMO 3")

    }
    
    func peripheral(_ peripheral: CBPeripheral, didDiscoverCharacteristicsFor service: CBService, error: Error?) {
        if (peripheral != self.peripheral) {
            // Wrong Peripheral
            return
        }
        
        if (error != nil) {
            return
        }
        print("OMO 4")

        if let characteristics = service.characteristics {
            for characteristic in characteristics {
                print(characteristic)
                if characteristic.uuid == characterRx {
                    self.positionCharacteristic = (characteristic)
                    peripheral.setNotifyValue(true, for: characteristic)
                    print("OMO 5")
                    print(positionCharacteristic ?? "xD")
                    // Send notification that Bluetooth is connected and all required characteristics are discovered
                    self.sendBTServiceNotificationWithIsBluetoothConnected(true)
                }
            }
        }
        self.writePosition("a")
    }
    
    // Mark: - Private
    
    func writePosition(_ position: String) {
        if let positionCharacteristic = self.positionCharacteristic {
            print("OMO 7")
            //let data = Data()
            //print(data)
            self.peripheral?.writeValue(position.data(using:String.Encoding.utf8, allowLossyConversion: true)!, for: positionCharacteristic, type: CBCharacteristicWriteType.withResponse)
        }
    }
    
    func sendBTServiceNotificationWithIsBluetoothConnected(_ isBluetoothConnected: Bool) {
        let connectionDetails = ["isConnected": isBluetoothConnected]
        NotificationCenter.default.post(name: Notification.Name(rawValue: BLEServiceChangedStatusNotification), object: self, userInfo: connectionDetails)
    }
    
}

