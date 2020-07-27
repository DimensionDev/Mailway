//
//  UIImage.swift
//  Mailway
//
//  Created by Cirno MainasuK on 2020-7-21.
//  Copyright © 2020 Dimension. All rights reserved.
//

import UIKit

extension UIImage {
    
    static func placeholder(size: CGSize = CGSize(width: 1, height: 1), color: UIColor) -> UIImage {
        let render = UIGraphicsImageRenderer(size: size)
        
        return render.image { (context: UIGraphicsImageRendererContext) in
            context.cgContext.setFillColor(color.cgColor)
            context.fill(CGRect(origin: .zero, size: size))
        }
    }
    
}
