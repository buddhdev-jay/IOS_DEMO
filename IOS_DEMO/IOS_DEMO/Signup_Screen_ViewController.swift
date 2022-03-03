//
//  Signup_Screen_ViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 02/03/22.
//

import UIKit

class Signup_Screen_ViewController: UIViewController {
    var timer: Timer?
    // MARK: - Outlet
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var lblAgeNumber: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func startProgressBar(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { timer in
                let change: Float = 0.1
                self.progressView.progress = self.progressView.progress + (change)
                if self.progressView.progress >= 1.0 {
                    self.timer?.invalidate()
                }
            })
    }
    
}

// MARK: - Outlet Action
extension Signup_Screen_ViewController{
    @IBAction func displayGender(_ sender: Any) {
        if genderSwitch.isOn{
            lblGender.text = "Male"
        }else
        {
            lblGender.text = "FeMale"
        }
        
    }
    
    @IBAction func displayAge(_ sender: Any) {
        lblAgeNumber.text = "\(Int(ageSlider.value))"
    }
}
