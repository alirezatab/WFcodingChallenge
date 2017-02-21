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
                        selectedTime: String,
                        indexPath: IndexPath)
}

class TimeCollectionVC: UIViewController, UICollectionViewDelegate {
    
    //MARK: - IBOutlets
    @IBOutlet weak var timeCollectionView: UICollectionView!
    
    //MARK: - Global Private constants & Variables
    private let dataSource = TimeCollectionViewDataSource()
    private var isSelected = false
    private var defaults = UserDefaults.standard
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
            // save the selected cell in user defaults cause it disappears when cells are reused
            defaults.set(true, forKey: "Time - \(indexPath.item)")
        } else {
            selectedCell.checkMarkImageView.alpha = 0
            isSelected = false
            defaults.set(false, forKey: "Time - \(indexPath.item)")
        }
        
        if timeSelectionDelegate != nil {
            timeSelectionDelegate?.isTimeSelected(isSelected,
                                                  selectedTime: selectedCell.timeLabel.text!,
                                                  indexPath: indexPath)
        }
    }
    
    // user taps a different cell and check mark disappears
    func collectionView(_ collectionView: UICollectionView,
                        didDeselectItemAt indexPath: IndexPath) {
        
        let selectedCell = collectionView.cellForItem(at: indexPath) as! TimeCollectionViewCell
        
        selectedCell.checkMarkImageView.alpha = 0
        isSelected = false
        defaults.set(false, forKey: "Time - \(indexPath.item)")
        
        if timeSelectionDelegate != nil {
            timeSelectionDelegate?.isTimeSelected(isSelected,
                                                  selectedTime: selectedCell.timeLabel.text!,
                                                  indexPath: indexPath)
        }
    }

    // MARK: - Memory Warning
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
