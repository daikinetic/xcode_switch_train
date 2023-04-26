//
//  FeedImageNode.swift
//  InstaClone
//
//  Created by Daiki Takano on 2023/04/16.
//

import AsyncDisplayKit

class FeedImageNode: BaseNode {
    
    var imageNode = ASNetworkImageNode()
    
    override init() {
        super.init()
        setUpNode()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        return ASInsetLayoutSpec(insets: .zero, child: imageNode)
    }
    
    private func setUpNode() {
        imageNode.backgroundColor = .purple
        imageNode.style.preferredSize.height = UIScreen.main.bounds.width / 2
        imageNode.style.preferredSize.width = UIScreen.main.bounds.width
    }
    
}
