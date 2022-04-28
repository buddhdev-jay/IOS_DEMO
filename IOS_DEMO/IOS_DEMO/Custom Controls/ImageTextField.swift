//
//  ImageTextField.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 27/04/22.
//

import UIKit

@IBDesignable
class ImageTextField : UITextField {
    
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
            var textRect = super.leftViewRect(forBounds: bounds)
            textRect.origin.x += leftPadding
            return textRect
        }
    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
        var textRect = super.rightViewRect(forBounds: bounds)
        textRect.origin.x -= rightPadding
        return textRect
    }
    
    @IBInspectable var leftPadding: CGFloat = 0 {
        didSet {}
    }
    @IBInspectable var rightPadding: CGFloat = 0 {
        didSet {}
    }
    @IBInspectable var leftImageMargin: CGFloat = 0 {
        didSet {}
    }
    @IBInspectable var rightImageMargin: CGFloat = 0
    {
        didSet {}
    }
    @IBInspectable var rightImage: UIImage? {
            didSet {
              updateRightView()
            }
        }
    @IBInspectable var leftImage: UIImage? {
            didSet {
                updateLeftView()
            }
        }
    
    func updateLeftView() {
           if let image = leftImage {
               leftViewMode = UITextField.ViewMode.always
               let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
               imageView.contentMode = .center
               let resizedImage = image.resized(to: CGSize(width: 20, height: self.frame.height - leftImageMargin))
               imageView.image = resizedImage
               leftView = imageView
           } else {
               leftViewMode = UITextField.ViewMode.never
               leftView = nil
           }
       }
    func updateRightView() {
           if let image = rightImage {
               rightViewMode = UITextField.ViewMode.always
               let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 10, height: self.frame.height))
               imageView.contentMode = .center
               let resizedImage = image.resized(to: CGSize(width: 20, height: self.frame.height - rightImageMargin))
               imageView.image = resizedImage
               rightView = imageView
           } else {
               rightViewMode = UITextField.ViewMode.never
               rightView = nil
           }
       }
}

extension UIImage {
    func resized(to size: CGSize) -> UIImage {
            return UIGraphicsImageRenderer(size: size).image { _ in
                draw(in:CGRect(origin: .zero, size: size))
            }
        }
}
