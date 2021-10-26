//
//  ViewController.swift
//  MentalWealth
//
//  Created by Khidr Brinkley on 9/28/21.
//

import UIKit

class PseudoLaunchViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
        _ = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(timeToMoveOn), userInfo: nil, repeats: false)
        }

    @objc func timeToMoveOn() {
            self.performSegue(withIdentifier: "goToMain", sender: self)
        }
}
