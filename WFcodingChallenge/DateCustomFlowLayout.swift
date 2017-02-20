//
//  DateCustomFlowLayout.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/17/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class DateCustomFlowLayout: UICollectionViewFlowLayout {
    
    //MARK: - Private Global Variables
    private let itemsPerRow: CGFloat = 5
    private let itemsPerColumn: CGFloat = 1
    
    //MARK: - Custom Inilitiazers
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //MARK: - custom Method
    // setup the flow layout between the cells & scroll Direction
    func setup() {
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 5
        self.scrollDirection = .horizontal
    }
    
    //MARK: - override cell size
    // create a cell based on customized width and height
    override var itemSize: CGSize{
        set {
            
        } get {
            let width = ((self.collectionView?.frame.width)! - (itemsPerRow - 1)) / itemsPerRow
            let height = ((self.collectionView?.frame.height)! - (itemsPerColumn - 1)) / itemsPerColumn
            
            return CGSize(width: width,
                          height: height)
        }
    }
}
