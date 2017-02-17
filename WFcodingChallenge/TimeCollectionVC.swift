//
//  TimeCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class TimeCollectionVC: UIViewController {

    
    @IBOutlet weak var timeCollectionView: UICollectionView!
    private let dataSource = TimeCollectionViewDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeCollectionView.dataSource = dataSource
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
