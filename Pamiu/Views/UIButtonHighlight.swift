//
//  UIButtonHighlight.swift
//  Pamiu
//
//  Created by gh.com on 2017/12/13.
//  Copyright © 2017年 studio.com. All rights reserved.
//

import UIKit

class UIButtonHighlight: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
    
    func initView()  {
    }
    
    override var isHighlighted: Bool{
        didSet {
            if isHighlighted {
                self.alpha = 0.7
            } else {
                self.alpha = 1
            }
        }
    }

}
