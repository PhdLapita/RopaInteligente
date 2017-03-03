//
//  LlaveroCollectionVC.swift
//  RopaInteligente
//
//  Created by Bear on 5/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit

class LlaveroCollectionVC: UICollectionViewController {
    let bluetoothManager = BTManager.getInstance()

    var iconList : [[String : String]] = [[String : String ]]()
    
    var icons : Array<String> = Array<String>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        iconList.append(["icon":"billetera_icon","title":"Billetera"])
        iconList.append(["icon":"carro_icon","title":"Auto"])
        iconList.append(["icon":"llave_icon","title":"Llaves"])
         }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return iconList.count
    }
    
    @IBAction func clicBack(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true)
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IconCell", for: indexPath)
        if let cell = cell as? IconCell{
        let icon = iconList[indexPath.row]
        if let icon = icon["icon"]{
            cell.imgIcon.image = UIImage(named: icon)
            }
            if let title = icon["title"]{
            cell.txtDescripcion.text = title
            }
        }
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        bluetoothManager.writePosition("a")
    }
    
}
