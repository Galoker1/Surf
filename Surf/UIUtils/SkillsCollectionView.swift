//
//  SkillsCollectionView.swift
//  Surf
//
//  Created by Егор  Хлямов on 13.08.2023.
//

import Foundation
import UIKit

class SkillsCollectionView: UICollectionView{
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        guard !CGSizeEqualToSize(bounds.size, intrinsicContentSize) else{return}
        invalidateIntrinsicContentSize()
    }
    override var intrinsicContentSize: CGSize{
        return contentSize
    }
}
