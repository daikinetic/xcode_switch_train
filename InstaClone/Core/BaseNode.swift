//
//  BaseNode.swift
//  InstaClone
//
//  Created by Daiki Takano on 2023/04/15.
//

import AsyncDisplayKit

class BaseNode: ASDisplayNode {
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
}
