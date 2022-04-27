//
//  SignupScreenViewControllertwo.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 27/04/22.
//

import UIKit

class SignupScreenViewControllertwo: UIViewController {

    // MARK: - Variables
    var timer: Timer?
    
    // MARK: - Outlet
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var submitButton: UIButton!
    @IBOutlet weak var lblStepper: UILabel!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var genderSwitch: UISwitch!
    @IBOutlet weak var ageSlider: UISlider!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var userBio: UITextView!
    
    // MARK: - View LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        userBio.layer.borderWidth = 1.0
        userBio.layer.borderColor = UIColor.black.cgColor
        userBio.layer.cornerRadius = 5.0
        self.hideKeyboardWhenTappedAround()
        emailTextField.delegate = self
        passwordTextField.delegate = self
    }
}

extension SignupScreenViewControllertwo {
    func hideKeyboardWhenTappedAround() {
            let tap = UITapGestureRecognizer(target: self, action: #selector(SignupScreenViewController.dismissKeyboard))
            tap.cancelsTouchesInView = false
            view.addGestureRecognizer(tap)
        }
        
        @objc func dismissKeyboard() {
            view.endEditing(true)
        }
}

extension SignupScreenViewControllertwo {
    
    @IBAction func submitbtnClicked(_ sender: UIButton) {
        timer = Timer.scheduledTimer(withTimeInterval: Constants.onePointZero, repeats: true, block: { timer in
            let change: Float = Float(Constants.zeroPointOne)
            self.progressView.progress = self.progressView.progress + (change)
            if self.progressView.progress >=  Float(Constants.onePointZero) {
                self.timer?.invalidate()
            }
        })
        alert(customMessage: Constants.signupbtn)
        
    }
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        lblStepper.text = (stepper.value).description
    }
    
    @IBAction func displayAge(_ sender: UISlider) {
        ageLabel.text = "\(Int(ageSlider.value))"
    }
    
    @IBAction func displayGender(_ sender: Any) {
        genderLabel.text = genderSwitch.isOn ? Constants.genderMale :Constants.genderFemale
    }
}

// MARK: -  UITextFieldDelegate
extension SignupScreenViewControllertwo : UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case emailTextField :
            emailTextField.resignFirstResponder()
            passwordTextField.becomeFirstResponder()
        case passwordTextField :
            passwordTextField.resignFirstResponder()
        default:
            break
        }
        return true
    }
    
}

// MARK: - Alert Function
extension UIViewController {
   public func alert (customMessage: String){
        let alert = UIAlertController(title: "UIAlertController", message: customMessage, preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Continue", style: UIAlertAction.Style.default, handler: nil))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
