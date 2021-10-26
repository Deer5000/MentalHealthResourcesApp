//
//  ResourcesViewController.swift
//  MentalWealth
//
//  Created by Khidr Brinkley on 10/15/21.
//

import UIKit
import MessageUI


class ResourcesViewController: UIViewController, MFMessageComposeViewControllerDelegate {
    @IBOutlet weak var SAMHButton: UIButton!
    @IBOutlet weak var SuicidePrevButton: UIButton!
    @IBOutlet weak var CrisisTextlineButton: UIButton!
    @IBOutlet weak var VetCrisisButton: UIButton!
    @IBOutlet weak var EmergencyButton: UIButton!
    @IBOutlet weak var HotlinesLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        SAMHButton.layer.shadowColor = UIColor.darkGray.cgColor
        SAMHButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        SAMHButton.layer.shadowRadius = 5
        SAMHButton.layer.shadowOpacity = 1.0
        SAMHButton.layer.cornerRadius = 12
        
        SuicidePrevButton.layer.shadowColor = UIColor.darkGray.cgColor
        SuicidePrevButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        SuicidePrevButton.layer.shadowRadius = 5
        SuicidePrevButton.layer.shadowOpacity = 1.0
        SuicidePrevButton.layer.cornerRadius = 12
        
        CrisisTextlineButton.layer.shadowColor = UIColor.darkGray.cgColor
        CrisisTextlineButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        CrisisTextlineButton.layer.shadowRadius = 5
        CrisisTextlineButton.layer.shadowOpacity = 1.0
        CrisisTextlineButton.layer.cornerRadius = 12
        
        
        VetCrisisButton.layer.shadowColor = UIColor.darkGray.cgColor
        VetCrisisButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        VetCrisisButton.layer.shadowRadius = 5
        VetCrisisButton.layer.shadowOpacity = 1.0
        VetCrisisButton.layer.cornerRadius = 12
        
        
        EmergencyButton.layer.shadowColor = UIColor.darkGray.cgColor
        EmergencyButton.layer.shadowOffset = CGSize(width: 5, height: 5)
        EmergencyButton.layer.shadowRadius = 5
        EmergencyButton.layer.shadowOpacity = 1.0
        EmergencyButton.layer.cornerRadius = 12
        
        
        HotlinesLabel.layer.shadowColor = UIColor.darkGray.cgColor
        HotlinesLabel.layer.shadowOffset = CGSize(width: 5, height: 5)
        HotlinesLabel.layer.shadowRadius = 5
        HotlinesLabel.layer.shadowOpacity = 1.0
        
        }
    
    
    @IBAction func SAMHPressed(_ sender: Any) {
        print("Substance Abuse and Mental Health Call Button Pressed")
        guard let number = URL(string: "tel://" + "1-800-662-4357") else { return }
        UIApplication.shared.open(number)
    }
    
    
    @IBAction func SuicidePreventionPressed(_ sender: Any) {
        print("Suicide Prevention Call Button Pressed")
        guard let number = URL(string: "tel://" + "1-800-273-8255") else { return }
        UIApplication.shared.open(number)
    }
    
    
    @IBAction func CrisisTextlinePressed(_ sender: Any) {
        print(" Crisis Textline Button Pressed")
        if (MFMessageComposeViewController.canSendText()) {
            let controller = MFMessageComposeViewController()
            controller.body = ""
            controller.recipients = ["741741"]
            controller.messageComposeDelegate = self
            self.present(controller, animated: true, completion: nil)
        }
    }
    
    func messageComposeViewController(_ controller: MFMessageComposeViewController, didFinishWith result: MessageComposeResult) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func VetCrisisPressed(_ sender: Any) {
        print(" Veteran Crisis Call Button Pressed")
        guard let number = URL(string: "tel://" + "844-693-5838") else { return }
        UIApplication.shared.open(number)
    }
    
    
    @IBAction func EmergencyPressed(_ sender: Any) {
        print("Emergency Button Pressed!")
        guard let number = URL(string: "tel://" + "911") else { return }
        UIApplication.shared.open(number)
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
