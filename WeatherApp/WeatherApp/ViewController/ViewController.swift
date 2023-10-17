//
//  ViewController.swift
//  WeatherApp
//
//  Created by Neosoft on 17/10/23.
//

import UIKit

class ViewController: UIViewController {

    //MARK: IBOutlets
    @IBOutlet weak var tempLbl: UILabel!
    @IBOutlet weak var cityLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        
    }

    @IBAction func viewDetailsBtnTapped(_ sender: Any) {
        let vc = UIViewController(nibName: <#T##String?#>, bundle: <#T##Bundle?#>)
    }
    
}

