//
//  OxigeViewController.swift
//  RopaInteligente
//
//  Created by Gustavo Herminio Lapa Velásquez on 25/07/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class OxigeViewController: UIViewController ,BLEDelegate {
    let bluetoothManager = BTManager.getInstance()
    var dato: String = " "
    var contador: Int = 0

    @IBOutlet weak var txtOxi: UILabel!
    @IBOutlet weak var imgOxi: UIImageView!
    
    
    @IBAction func clicAtras(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
        //bluetoothManager.desconectando()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bluetoothManager.bledelegate = self     //Nesesario para poder transferir datos del BTManager hacia el Activity mediante el uso de protocolos(similar to Interface in Android)
        // Do any additional setup after loading the view.
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
            let index2 = dato.characters.index(of: "&") ?? dato.endIndex
            let index3 = dato.index(after: index2)
            let index4 = dato.characters.index(of: "/") ?? dato.endIndex
            let  rangooxi = index3..<index4
            txtOxi.text = dato[rangooxi].appending(" %")
            if contador == 0{
                imgOxi.image = UIImage(named: "ic_blood_b")
                contador = 1
            }else{
                imgOxi.image = UIImage(named: "ic_blood_a")
                contador = 0
            }
           
            if(dato[rangooxi] == "c"){
                txtOxi.text = "Calculando"
            }
            if(dato[rangooxi] == "s"){
                txtOxi.text = "Sin señal"
            }
            
        }
        else if(dato.characters.contains("&") && !dato.characters.contains("/")){
            let index2 = dato.characters.index(of: "&") ?? dato.endIndex
            let index3 = dato.index(after: index2)
            let index4 = dato.characters.index(of: "$") ?? dato.endIndex
            let  rangooxi = index3..<index4
            
            txtOxi.text = dato[rangooxi].appending(" %")
            if contador == 0{
                imgOxi.image = UIImage(named: "ic_blood_b")
                contador = 1
            }else{
                imgOxi.image = UIImage(named: "ic_blood_a")
                contador = 0
            }

            if(dato[rangooxi] == "c"){
                txtOxi.text = "Calculando"
            }
            if(dato[rangooxi] == "s"){
                txtOxi.text = "Sin señal"
            }
        }else{
            txtOxi.text = "Sin Señal"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
