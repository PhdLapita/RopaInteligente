//
//  DatosViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import Foundation
class DatosViewController: UIViewController ,BLEDelegate  {
  let bluetoothManager = BTManager.getInstance()
    var contador: Int = 0
    var dato: String = " "
    @IBOutlet weak var txtPulso: UILabel!
    @IBOutlet weak var imgPulso: UIImageView!
    
    @IBOutlet weak var imgTemp: UIImageView!
    @IBOutlet weak var txtTemp: UILabel!
    
    @IBOutlet weak var imgOximetro: UIImageView!
    @IBOutlet weak var txtOximetro: UILabel!
    
    @IBOutlet weak var imgEstado: UIImageView!
    @IBOutlet weak var txtEstado: UILabel!
    
    @IBAction func clicBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        bluetoothManager.desconectando()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    override func viewWillAppear(_ animated: Bool) {
        bluetoothManager.bledelegate = self     //Nesesario para poder transferir datos del BTManager hacia el Activity mediante el uso de protocolos(similar to Interface in Android)
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func bleDidReceiveData(_ data: Data?){
        print("sí, me ejecuto")
       dato = String(data: data!, encoding: .utf8)!
        if(dato.characters.contains("/") && dato.characters.contains("&")){
            let index0 = dato.characters.index(of: "#") ?? dato.endIndex
            let index1 = dato.index(after: index0)
            let index2 = dato.characters.index(of: "&") ?? dato.endIndex
            let index3 = dato.index(after: index2)
            let index4 = dato.characters.index(of: "/") ?? dato.endIndex
            let index5 = dato.index(after: index4)
            let indexfinal = dato.characters.index(of: "$") ?? dato.endIndex
            let  rangopulso = index1..<index2
            let  rangooxi = index3..<index4
            let  rangotemp = index5..<indexfinal
            txtTemp.text = dato[rangotemp].appending(" ºC")
            txtPulso.text = dato[rangopulso].appending(" lpm")
            txtOximetro.text = dato[rangooxi].appending(" % SpO2")
            if contador == 0{
                imgPulso.image = UIImage(named: "ic_heart_b")
                imgTemp.image = UIImage(named: "ic_temp_b")
                imgOximetro.image = UIImage(named: "ic_blood_b")
                contador = 1
            }else{
                imgPulso.image = UIImage(named: "ic_heart_a")
                imgTemp.image = UIImage(named: "ic_temp_a")
                imgOximetro.image = UIImage(named: "ic_blood_a")
                contador = 0
            }
           
            if(dato[rangopulso] == "c"){
                txtPulso.text = "Calculando"
                txtTemp.text = "Calculando"
                txtOximetro.text = "Calculando"

            }
            if(dato[rangopulso] == "s"){
                txtPulso.text = "Sin señal"
                txtOximetro.text = "Sin señal"
                txtTemp.text = "Sin señal"
            }
            

        }
        else if(dato.characters.contains("&") && !dato.characters.contains("/")){
            let index0 = dato.characters.index(of: "#") ?? dato.endIndex
            let index1 = dato.index(after: index0)
            let index2 = dato.characters.index(of: "&") ?? dato.endIndex
            let index3 = dato.index(after: index2)
            let index4 = dato.characters.index(of: "$") ?? dato.endIndex
            let rangopulso = index1..<index2
            let  rangooxi = index3..<index4
            txtPulso.text = dato[rangopulso].appending(" lpm")
            txtOximetro.text = dato[rangooxi].appending(" % SpO2")
            txtTemp.text = "Sin señal"
            if contador == 0{
                imgPulso.image = UIImage(named: "ic_heart_b")
                imgOximetro.image = UIImage(named: "ic_blood_b")
                contador = 1
            }else{
                imgPulso.image = UIImage(named: "ic_heart_a")
                imgOximetro.image = UIImage(named: "ic_blood_a")
                contador = 0
            }
            
            if(dato[rangopulso] == "c"){
                txtPulso.text = "Calculando"
                txtOximetro.text = "Calculando"
                
            }
            if(dato[rangopulso] == "s"){
                txtPulso.text = "Sin señal"
                txtOximetro.text = "Sin señal"
            }

        }else{
            let  index0 = dato.characters.index(of: "#") ?? dato.endIndex
            let  index1 = dato.index(after: index0)
            let   index2 = dato.characters.index(of: "$") ?? dato.endIndex
            let  rangopulso = index1..<index2
            txtPulso.text = dato[rangopulso].appending(" lpm")
            txtTemp.text = "Sin señal"
            txtOximetro.text = "Sin señal"
            
            if contador == 0{
                imgPulso.image = UIImage(named: "ic_heart_b")
                imgTemp.image = UIImage(named: "ic_temp_b")
                imgOximetro.image = UIImage(named: "ic_blood_b")
                contador = 1
            }else{
                imgPulso.image = UIImage(named: "ic_heart_a")
                imgTemp.image = UIImage(named: "ic_temp_a")
                imgOximetro.image = UIImage(named: "ic_blood_a")
                contador = 0
            }

            if(dato[rangopulso] == "c"){
                txtPulso.text = "Calculando"
                txtTemp.text = "Calculando"
                txtOximetro.text = "Calculando"
                
            }
            if(dato[rangopulso] == "s"){
                txtPulso.text = "Sin señal"
            }
        }
        }

    }



