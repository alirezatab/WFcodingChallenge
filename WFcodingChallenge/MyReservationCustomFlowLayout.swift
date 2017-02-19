//
//  MyReservationCustomFlowLayout.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/18/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class MyReservationCustomFlowLayout: UICollectionViewFlowLayout {
    
    //Mark: - Private Global Constats
    private let itemsPerRow: CGFloat = 2.5
    private let itemsPerColumn: CGFloat = 2.5
    private let inset = UIEdgeInsets(top: 15, left: 10, bottom: 15, right: 10)

    //Mark: - Custom Inilitiazers
    override init() {
        super.init()
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    //Mark: - custom Method
    // setup the flow layout between the cells & scroll Direction
    func setup() {
        self.minimumLineSpacing = 10
        self.minimumInteritemSpacing = 5
        self.scrollDirection = .vertical
    }
    
    //Mark: - override cell size
    // create a cell based on customized width and height
    override var itemSize: CGSize{
        set {
            
        } get {
            let width = (self.collectionView?.frame.width)! - inset.left - inset.right
            let height = ((self.collectionView?.frame.height)! - (itemsPerColumn - 1)) / itemsPerColumn
            
            return CGSize(width: width,
                          height: height)
        }
    }

}
