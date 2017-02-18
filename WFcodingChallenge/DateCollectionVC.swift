//
//  DateCollectionVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

// set custom delegate for date selection
protocol DateSelectionDelegate {
    func isDateSelected(_ isSelected: Bool)
}

class DateCollectionVC: UIViewController, UICollectionViewDelegate {

    @IBOutlet weak var dateCollectionView: UICollectionView!
    @IBOutlet weak var monthLabel: UILabel!
    
    private var dateFormatter = DateFormatter()
    private let currentDate = NSDate()
    private var daysInMonth = Int()
    private let dataSource = DateCollectionViewDataSource()
    private var isSelected = false
    
    var dateSelectionDelegate : DateSelectionDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dateCollectionView.dataSource = dataSource
        dateCollectionView.delegate = self
        dateCollectionView.collectionViewLayout = DateCustomFlowLayout()

        
        monthLabel.text = getMonth()
    }
    
    // based on current Date, just extract the Month
    func getMonth() -> String {
        dateFormatter.dateFormat = "MMMM"
        return dateFormatter.string(from: currentDate as Date)
    }
    
    // user taps cell & check Mark appreas or disappears
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! DateCollectionViewCell
        
        // checks to see if same cell was tapped again
        if !isSelected {
            selectedCell.checkMarkImageView.alpha = 0.75
            isSelected = true

        } else {
            selectedCell.checkMarkImageView.alpha = 0
            isSelected = false
        }
        
        if dateSelectionDelegate != nil {
            dateSelectionDelegate?.isDateSelected(isSelected)
        }
    }
    
    // user taps a different cell and check mark disappears
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let selectedCell = collectionView.cellForItem(at: indexPath) as! DateCollectionViewCell
        
        selectedCell.checkMarkImageView.alpha = 0
        isSelected = false
        
        if dateSelectionDelegate != nil {
            dateSelectionDelegate?.isDateSelected(isSelected)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
