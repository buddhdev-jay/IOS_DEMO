//
//  imagePickerViewController.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 09/03/22.
//

import UIKit

class imagePickerViewController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var btnSelectImage: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblDate: UILabel!
    // MARK: - variables
    let dateFormatter = DateFormatter()
    override func viewDidLoad() {
        super.viewDidLoad()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        imageView.layer.cornerRadius = 75
        self.title = "Image Picker"
    }

}
// MARK: - Outlet Actions
extension imagePickerViewController{
    @IBAction func dateChanged(_ sender: UIDatePicker) {
        lblDate.text = dateFormatter.string(from: sender.date)
    }

    @IBAction func pickImage(_ sender: UIButton) {
        let pickimage = UIImagePickerController()
        pickimage.sourceType = .photoLibrary
        pickimage.allowsEditing = true
        pickimage.delegate = self
        self.present(pickimage,animated: true,completion: nil)
    }
}
// MARK: - UIImagePickerControllerDelegate
extension imagePickerViewController:UIImagePickerControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let image = info[.editedImage] else{
                return
            }
            self.imageView.image = image as? UIImage
            dismiss(animated: true, completion: nil)
        }
}
// MARK: - UINavigationControllerDelegate
extension imagePickerViewController:UINavigationControllerDelegate{
    
}
