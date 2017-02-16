//
//  SpaServiceVC.swift
//  WFcodingChallenge
//
//  Created by ALIREZA TABRIZI on 2/16/17.
//  Copyright © 2017 AR-T.com, Inc. All rights reserved.
//

import UIKit

class SpaServiceVC: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var reserveButton: UIButton!
    
    var scrollWidth : CGFloat = UIScreen.main.bounds.size.width
    var scrollHeight : CGFloat = UIScreen.main.bounds.size.height - 64
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // round the edges
        containerView.layer.cornerRadius = 15
        containerView.layer.masksToBounds = true
        
        reserveButton.layer.cornerRadius = 5
        reserveButton.layer.masksToBounds = true
        
        // setup the size o the scrollView - 3 is cause we have 3 pages
        scrollView?.contentSize = CGSize(width: (scrollWidth * 3), height: scrollHeight)
        
        //set the delegate of control view
        scrollView?.delegate = self;
        
        scrollView?.isPagingEnabled = true
        
        setupOfferPages()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // assign the correct image to the correct page using for-Loop
    func setupOfferPages() {
        for i in 0...2 {
            // insert a imageview inside the scrollerView
            let imageView = UIImageView.init()
            imageView.frame = CGRect(x: scrollWidth * CGFloat (i), y: 0, width: scrollWidth,height: scrollHeight)
            
            switch i {
            case 1:
                imageView.image = UIImage(named: "HotStoneOffer")
            case 2:
                imageView.image = UIImage(named: "DeepTissueOffer")
            default:
                imageView.image = UIImage(named: "MothersDayOffer")
            }
            
            scrollView?.addSubview(imageView)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        setIndiactorForCurrentPage()
    }
    
    // calculates the page number based on calculation
    func setIndiactorForCurrentPage()  {
        let page = (scrollView?.contentOffset.x)!/scrollWidth
        pageControl?.currentPage = Int(page)
    }
    
    // change page based on taps on pageController
    @IBAction func onPageControllerTapped() {
        scrollView!.scrollRectToVisible(CGRect( x: scrollWidth * CGFloat ((pageControl?.currentPage)!),
                                                y: 0,
                                                width: scrollWidth,
                                                height: scrollHeight),
                                        animated: true)
    }

}
