//
//  TimeCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class TimeCollectionVC: UIViewController, UICollectionViewDelegate {

    
    @IBOutlet weak var timeCollectionView: UICollectionView!
    private let dataSource = TimeCollectionViewDataSource()
    private var isSelected = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeCollectionView.dataSource = dataSource
        timeCollectionView.delegate = self
    }
    
    // user taps cell & check Mark appreas or disappears
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        
        // checks to see if same cell was tapped again
        if !isSelected {
            selectedCell.checkMarkImageView.alpha = 0.75
            isSelected = true
        } else {
            selectedCell.checkMarkImageView.alpha = 0
            isSelected = false
        }
    }
    
    // user taps a different cell and check mark disappears
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        
        selectedCell.checkMarkImageView.alpha = 0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
