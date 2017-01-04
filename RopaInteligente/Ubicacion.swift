//
//  Ubicacion.swift
//  RopaInteligente
//
//  Created by Gustavo Herminio Lapa Velásquez on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class Ubicacion: NSObject {
    let direccion : String
    let latitud: Double
    let longitud : Double
    
    init(address: String, latitude: Double, longitude: Double, image:String) {
        self.direccion = address
        self.latitud = latitude
        self.longitud = longitude
    }

}
