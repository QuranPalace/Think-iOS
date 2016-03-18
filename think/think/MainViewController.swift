//
//  MainViewController.swift
//  think
//
//  Created by Reza Shayestehpour on 2/20/16.
//  Copyright © 2016 quranpalace.net. All rights reserved.
//

import UIKit

class MainViewController: UIViewController, UIScrollViewDelegate {
    
    // MARK: - properties
    
    var mainView = UIView()
    
    // MARK: - outlets

    @IBOutlet weak var scrollView: UIScrollView!
    
    // MARK: - view controller's life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.scrollView.delegate = self
        
        let longPressRecognizer = UILongPressGestureRecognizer(target: self, action: "longPress:")
        self.view.addGestureRecognizer(longPressRecognizer)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.initializeScrollView()
        self.addViewsToScrollView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - gestures
    
    func longPress(longPressGestureRecognizer: UILongPressGestureRecognizer) {
        let width = self.view.frame.width
        //let height = self.view.frame.height
        if longPressGestureRecognizer.state == .Began {
            UIView.animateWithDuration(0.6, animations: {
                self.scrollView.zoomScale = width / (width + 60)
                self.scrollView.contentOffset.x -= 30
                self.mainView.alpha -= 0.5
                },
                completion: nil)
        }
        
        if longPressGestureRecognizer.state == .Ended {
            UIView.animateWithDuration(0.6, animations: {
                self.scrollView.contentOffset.x += 30
                self.scrollView.zoomScale = 1
                self.mainView.alpha += 0.5
                },
                completion: nil)
        }
    }
    
    // MARK: ui code
    
    func initializeScrollView() {
        
        self.scrollView.contentSize = CGSize(width: self.view.frame.width, height: self.view.frame.height + 60)
        
        // setting scrollview initial zoom
        self.scrollView.pinchGestureRecognizer?.enabled = false
        
        
    }
    
    func addViewsToScrollView() {
        self.mainView = UIView(frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height))
        self.mainView.backgroundColor = UIColor.blueColor()
        
        self.scrollView.addSubview(self.mainView)
    }
    
    // MARK: - scrollView delegate
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return self.scrollView.subviews.first
    }
    
    func scrollViewDidEndZooming(scrollView: UIScrollView, withView view: UIView?, atScale scale: CGFloat) {
        
    }
}

