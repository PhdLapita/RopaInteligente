//
//  BTDelegate.swift
//  RopaInteligente
//
//  Created by Bear on 9/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import CoreBluetooth

protocol BTDelegate {
    
   func encontreUnDevicexD(_ lista: Array<CBPeripheral>)
}
