//
//  SocialNode.swift
//  InstaClone
//
//  Created by Daiki Takano on 2023/04/16.
//

import AsyncDisplayKit

class SocialNode: BaseNode {
    var shareButtonNode = ASButtonNode()
    var commentButtonNode = ASButtonNode()
    var bookmarkButtonNode = ASButtonNode()
    var likeButtonNode = ASButtonNode()
    
    var likesTextNode = ASTextNode()
    var likesCounter: Int? = 10
    
    override init() {
        super.init()
        setUpNodes()
        populate(numberOfLikes: likesCounter)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let hStackBookmark = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 0,
            justifyContent: .end,
            alignItems: .end,
            children: [bookmarkButtonNode])
        
        let bookmarkPadding = ASInsetLayoutSpec(insets: .init(top: 0, left: 0, bottom: 0, right: 10), child: hStackBookmark)
        bookmarkPadding.style.flexGrow = 1
        
        let hStackShareButtons = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 10,
            justifyContent: .start,
            alignItems: .stretch,
            children: [likeButtonNode, commentButtonNode, shareButtonNode, bookmarkPadding])
        
        let shareButtonPadding = ASInsetLayoutSpec(
            insets: .init(top: 10, left: 10, bottom: 10, right: 0),
            child: hStackShareButtons)
        
        var elements = [ASLayoutElement]()
        elements.append(shareButtonPadding)
        
        if let likes = likesCounter, likes > 0 {
            var localInset = ASInsetLayoutSpec(
                insets: .init(top: 0, left: 10, bottom: 10, right: 0),
                child: likesTextNode)
            elements.append(localInset)
        }
        
        let vStack = ASStackLayoutSpec(
            direction: .vertical,
            spacing: 6,
            justifyContent: .start,
            alignItems: .stretch,
            children: elements)
        
        return vStack
    }
    
    private func setUpNodes () {
        shareButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        commentButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        bookmarkButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        likeButtonNode.style.preferredSize = CGSize(width: 30, height: 30)
        
        shareButtonNode.setImage(UIImage(named: "share"), for: .normal)
        commentButtonNode.setImage(UIImage(named: "comment"), for: .normal)
        bookmarkButtonNode.setImage(UIImage(named: "bookmark"), for: .normal)
        likeButtonNode.setImage(UIImage(named: "like"), for: .normal)
    }
    
    func populate(numberOfLikes: Int?) {
        guard let numberOfLikes = numberOfLikes else { return }
        let stringValueForLikes = numberOfLikes > 1 ? "\(numberOfLikes) likes" : "\(numberOfLikes) like"
        
        likesTextNode.attributedText = NSAttributedString(
            string: stringValueForLikes,
            attributes: [NSAttributedString.Key.foregroundColor: UIColor.label,
                         NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 13)]
        )
        
    }
    
}
