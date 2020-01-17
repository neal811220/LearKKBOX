//
//  Kingfisher.swift
//  LearKKBOX
//
//  Created by Neal on 2020/1/17.
//  Copyright © 2020 neal812220. All rights reserved.
//

import Foundation
import Kingfisher

extension UIImageView {
    
    func loadImage(urlString: String?, image: UIImage? = nil) {
        
        guard urlString != nil else { return }
        
        let url = URL(string: urlString!)
        
        self.kf.setImage(with: url, placeholder: image)
    }
}
