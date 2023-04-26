//
//  BaseCellNode.swift
//  InstaClone
//
//  Created by Daiki Takano on 2023/04/16.
//

import AsyncDisplayKit

class BaseCellNode: ASCellNode {
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
    }
}
