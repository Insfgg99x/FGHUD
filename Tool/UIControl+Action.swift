//
//  UIControl+Action.swift
//  Fate
//
//  Created by xgf on 2017/11/2.
//  Copyright © 2017年 xgf. All rights reserved.
//

import UIKit

private var UIControlActionHandlerKey = "UIControlActionHandlerKey"

extension UIControl {
    @objc func handleClick(events: UIControl.Event, click: @escaping ((UIControl) -> ())) {
        objc_setAssociatedObject(self, &UIControlActionHandlerKey, click, objc_AssociationPolicy.OBJC_ASSOCIATION_COPY_NONATOMIC)
        self.addTarget(self, action: #selector(sc_handleClick(_:)), for: events)
    }
    @objc private func sc_handleClick(_ sender:UIControl){
        let handler:((UIControl) -> ())? = objc_getAssociatedObject(self, &UIControlActionHandlerKey) as? ((UIControl) -> ())
        guard handler != nil else {
            return
        }
        handler!(sender)
    }
}

