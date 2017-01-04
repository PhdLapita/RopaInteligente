//
//  MapaViewController.swift
//  RopaInteligente
//
//  Created by Bear on 3/01/17.
//  Copyright © 2017 BearCreekMining. All rights reserved.
//

import UIKit
import MapKit

class MapaViewController: UIViewController {
    
    @IBOutlet weak var btnLocalizar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ///let button = UIButton(type: .custom)
        btnLocalizar.frame = CGRect(x: 264, y: 463, width: 40, height: 40)
        btnLocalizar.layer.cornerRadius = 0.5 * btnLocalizar.bounds.size.width
        btnLocalizar.clipsToBounds = true
        
        btnLocalizar.setImage(UIImage(named:"location_icon.png"), for: .normal)
        btnLocalizar.addTarget(self, action: #selector(thumbsUpButtonPressed), for: .touchUpInside)
        view.addSubview(btnLocalizar)
        // Do any additional setup after loading the view.
    }
    func thumbsUpButtonPressed() {
        print("thumbs up button pressed")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
