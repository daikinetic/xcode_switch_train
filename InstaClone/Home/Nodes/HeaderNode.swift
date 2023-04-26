//
//  HeaderNode.swift
//  InstaClone
//
//  Created by Daiki Takano on 2023/04/16.
//

import AsyncDisplayKit

class HeaderNode: BaseNode {
    
    var profileImage = ASNetworkImageNode()
    var name = ASTextNode()
    var extraButton = ASButtonNode()
    
    override init() {
        super.init()
        setUp()
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let leftPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 8, left: 16, bottom: 8, right: 0),
            child: profileImage)
        
        let iconSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [extraButton])
        
        let rightPadding = ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 16),
            child: iconSpec)
        rightPadding.style.flexGrow = 1
        
        let finalSpec = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .start,
            alignItems: .center,
            children: [leftPadding, name, rightPadding])
        
        return finalSpec
    }
    
    private func setUp() {
        profileImage.backgroundColor = .green
        profileImage.cornerRadius = 35/2
        profileImage.style.preferredSize = CGSize(width: 35, height: 35)
        name.attributedText = NSAttributedString(string: "Texture is cool", attributes:
                                                    [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 17),
                                                     NSAttributedString.Key.foregroundColor: UIColor.label])
        if let safeImage = UIImage(named: "elipses") {
            let image = safeImage
            extraButton.setImage(image, for: .normal)
            extraButton.style.preferredSize = CGSize(width: 10, height: 10)
        }
//        let image = ASImageNodeTintColorModificationBlock(.black)(UIImage(named: "elipses")!)
    }
    
}
