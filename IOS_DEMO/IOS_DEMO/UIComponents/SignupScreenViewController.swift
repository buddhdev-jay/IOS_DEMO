//
//  Signup_Screen_ViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 02/03/22.
//

import UIKit
import LocalAuthentication

class SignupScreenViewController: UIViewController {
    
    // MARK: - Variables
    var timer: Timer?
    
    // MARK: - Outlet
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var lblSteppervalue: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var lblAgeNumber: UILabel!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var userBio: UITextView!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userBio.layer.borderWidth = 1.0
        userBio.layer.borderColor = UIColor.black.cgColor
        userBio.layer.cornerRadius = 5.0
        
        self.hideKeyboardWhenTappedAround()
    }
}

// MARK: - Outlet Action
extension SignupScreenViewController {
    
    @IBAction func displayGender(_ sender: Any) {
        lblGender.text = genderSwitch.isOn ? Constants.genderMale :Constants.genderFemale
    }
    
    @IBAction func displayAge(_ sender: Any) {
        lblAgeNumber.text = "\(Int(ageSlider.value))"
    }
    
    @IBAction func stepperValue(_ sender: UIStepper) {
        lblSteppervalue.text = (stepper.value).description
    }
    
    @IBAction func startProgressBar(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: Constants.onePointZero, repeats: true, block: { timer in
            let change: Float = Float(Constants.zeroPointOne)
            self.progressView.progress = self.progressView.progress + (change)
            if self.progressView.progress >=  Float(Constants.onePointZero) {
                self.timer?.invalidate()
            }
        })
        let context:LAContext = LAContext()
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,error: nil) {
            context.evaluatePolicy(LAPolicy.deviceOwnerAuthenticationWithBiometrics, localizedReason:Constants.needyourlogin, reply: {(wascorrect,error) in
                wascorrect ? print(Constants.correct) : print(Constants.incorrect)
            })
        }
        else {
            print(Constants.notablesuccess)
        }
    }
}

extension SignupScreenViewController {
    func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(SignupScreenViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}
