//
//  RoundedImage.swift
//  IOS_DEMO
//
//  Created by Jay Buddhdev on 07/04/22.
//

import UIKit

class RoundedImage: UIImageView {

    override init(image: UIImage?) {
            super.init(image: image)
        }

        override init(frame: CGRect) {
            super.init(frame: frame)
        }

        required init?(coder aDecoder: NSCoder) {
            super.init(coder: aDecoder)
        }

        override func layoutSubviews() {
            super.layoutSubviews()
            self.layer.cornerRadius = self.frame.size.height / 2
            self.clipsToBounds = true
        }
}
