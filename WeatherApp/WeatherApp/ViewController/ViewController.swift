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
    
    //MARK: Variables
    var viewModel = CommonViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    func setup() {
        viewModel.fetchCurrentWeather { result in
            switch result {
            case .success(_):
                print("Success")
            case .failure(_):
                print("Failure")
            }
        }
    }

    @IBAction func viewDetailsBtnTapped(_ sender: Any) {
        var storyboard : UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        var vc : DetailViewController = storyboard.instantiateViewController(withIdentifier: "DetailViewController") as! DetailViewController
        self.present(vc, animated: true, completion: nil)
    }
    
}

