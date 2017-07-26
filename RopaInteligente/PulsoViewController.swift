//
//  PulsoViewController.swift
//  RopaInteligente
//
//  Created by Gustavo Herminio Lapa Velásquez on 25/07/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class PulsoViewController: UIViewController ,BLEDelegate  {
    let bluetoothManager = BTManager.getInstance()
    var dato: String = " "
    var contador: Int = 0
    @IBOutlet weak var imgPulso: UIImageView!
    @IBOutlet weak var txtPulso: UILabel!
    
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
            let index0 = dato.characters.index(of: "#") ?? dato.endIndex
            let index1 = dato.index(after: index0)
            let index2 = dato.characters.index(of: "&") ?? dato.endIndex
            let  rangopulso = index1..<index2
            txtPulso.text = dato[rangopulso].appending(" lpm")
            if contador == 0{
                imgPulso.image = UIImage(named: "ic_heart_b")
                contador = 1
            }else{
                imgPulso.image = UIImage(named: "ic_heart_a")
                contador = 0
            }
            
            if(dato[rangopulso] == "c"){
                txtPulso.text = "Calculando"
            }
            if(dato[rangopulso] == "s"){
                txtPulso.text = "Sin señal"
            }
            
        }
        else if(dato.characters.contains("&") && !dato.characters.contains("/")){
            let index0 = dato.characters.index(of: "#") ?? dato.endIndex
            let index1 = dato.index(after: index0)
            let index2 = dato.characters.index(of: "&") ?? dato.endIndex
            let rangopulso = index1..<index2
            txtPulso.text = dato[rangopulso].appending(" lpm")
            if contador == 0{
                imgPulso.image = UIImage(named: "ic_heart_b")
                contador = 1
            }else{
                imgPulso.image = UIImage(named: "ic_heart_a")
                contador = 0
            }
            if(dato[rangopulso] == "c"){
                txtPulso.text = "Calculando"
            }
            if(dato[rangopulso] == "s"){
                txtPulso.text = "Sin señal"
            }
           
        }else{
            let  index0 = dato.characters.index(of: "#") ?? dato.endIndex
            let  index1 = dato.index(after: index0)
            let   index2 = dato.characters.index(of: "$") ?? dato.endIndex
            let  rangopulso = index1..<index2
            txtPulso.text = dato[rangopulso].appending(" lpm")
            if contador == 0{
                imgPulso.image = UIImage(named: "ic_heart_b")
                contador = 1
            }else{
                imgPulso.image = UIImage(named: "ic_heart_a")
                contador = 0
            }
            
            if(dato[rangopulso] == "c"){
                txtPulso.text = "Calculando"
            }
            if(dato[rangopulso] == "s"){
                txtPulso.text = "Sin señal"
            }
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
