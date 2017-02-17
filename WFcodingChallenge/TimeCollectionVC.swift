//
//  TimeCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

private let reuseIdentifier = "TimeCollectionViewCell"

class TimeCollectionVC: UIViewController, UICollectionViewDataSource {

    @IBOutlet weak var timeCollectionView: UICollectionView!    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timeCollectionView.dataSource = self
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = timeCollectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! TimeCollectionViewCell
        
        cell.timeLabel.text = "Fuck Off Boyo"
        
        return cell
    }
    
}
