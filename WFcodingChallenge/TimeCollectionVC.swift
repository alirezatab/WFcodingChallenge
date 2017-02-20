//
//  TimeCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

// set custom delegate for time selection
protocol TimeSelectionDelegate {
    func isTimeSelected(_ isSelected: Bool,
                        selectedTime: String)
}

class TimeCollectionVC: UIViewController, UICollectionViewDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var timeCollectionView: UICollectionView!
    
    //MARK: - Global Private constants & Variables
    private let dataSource = TimeCollectionViewDataSource()
    private var isSelected = false
    private var indexPathOfSelectedCell = IndexPath()
    
    // Mark: - Golbal public delegate variable
    var timeSelectionDelegate : TimeSelectionDelegate? = nil
    
    // MARK: - Life Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeCollectionView.dataSource = dataSource
        timeCollectionView.delegate = self
        timeCollectionView.collectionViewLayout = TimeCustomFlowLayout()
    }
    
    //MARK: - Collection View Delegate
    // user taps cell & check Mark appreas or disappears
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        
        // checks to see if same cell was tapped again
        if !isSelected {
            selectedCell.checkMarkImageView.alpha = 0.75
            isSelected = true
            indexPathOfSelectedCell = indexPath
        } else {
            selectedCell.checkMarkImageView.alpha = 0
            isSelected = false
        }
        
        if timeSelectionDelegate != nil {
            timeSelectionDelegate?.isTimeSelected(isSelected,
                                                  selectedTime: selectedCell.timeLabel.text!)
        }
    }
    
    // user taps a different cell and check mark disappears
    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        
        selectedCell.checkMarkImageView.alpha = 0
        isSelected = false
        
        if timeSelectionDelegate != nil {
            timeSelectionDelegate?.isTimeSelected(isSelected,
                                                  selectedTime: selectedCell.timeLabel.text!)
        }
    }

    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
