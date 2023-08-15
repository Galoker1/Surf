//
//  LeftAlignedFlowLayout.swift
//  Surf
//
//  Created by Егор  Хлямов on 13.08.2023.
//

import Foundation
import UIKit

class LeftAlignedFlowLayout:UICollectionViewFlowLayout{
    
    override func layoutAttributesForElements(in rect: CGRect) -> [UICollectionViewLayoutAttributes]? {
        let attributes = super.layoutAttributesForElements(in: rect)
        
        var leftMargin = sectionInset.left
        var maxY:CGFloat = -1.0
        attributes?.forEach{ attribute in
            if attribute.frame.origin.y >= maxY{
                leftMargin = sectionInset.left
            }
            attribute.frame.origin.x = leftMargin
            
            leftMargin += attribute.frame.width + minimumInteritemSpacing
            maxY = max(attribute.frame.maxY,maxY)
            
        }
        return attributes
    }
}
