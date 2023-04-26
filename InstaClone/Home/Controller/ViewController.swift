//
//  ViewController.swift
//  InstaClone
//
//  Created by Daiki Takano on 2023/04/15.
//

import AsyncDisplayKit

class ViewController: ASDKViewController<BaseNode> {
    
    var newsFeed: HomePresentation!

    override init() {
        super.init(node: BaseNode())
        newsFeed = HomePresentation()
        self.node.addSubnode(newsFeed)
        self.node.backgroundColor = .white
        
        self.node.layoutSpecBlock = { (node, constrainedSize) in
            return ASInsetLayoutSpec(insets: UIEdgeInsets.zero, child: self.newsFeed)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        // Do any additional setup after loading the view.
//    }
//

}

