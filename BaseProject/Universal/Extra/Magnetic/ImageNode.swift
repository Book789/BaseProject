//
//  ImageNode.swift
//  swift_test
//
//  Created by a on 2022/5/23.
//

import UIKit
import SpriteKit

class ImageNode: Node {
    override var image: UIImage? {
        didSet {
            texture = image.map { SKTexture(image: $0) }
        }
    }
    override func selectedAnimation() {
        self.image = UIImage(named: "center_cp_bg")
        self.fontColor = UIColor.black
        super.selectedAnimation()

    }
    override func deselectedAnimation() {
        super.deselectedAnimation()
        self.image = UIImage(named: "组 3545")
        self.fontColor = UIColor.white
        if let texture = texture {
          fillTexture = texture
        }

    }

}
