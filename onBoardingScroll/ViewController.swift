//
//  ViewController.swift
//  onBoardingScroll
//
//  Created by yuki.pro on 2017. 7. 26..
//  Copyright © 2017년 yuki. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var startButton: UIButton!
    
    var imgArr = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //scrollView.delegate = self
        startButton.alpha = 0
        
        imgArr = [#imageLiteral(resourceName: "page1"),#imageLiteral(resourceName: "page2"),#imageLiteral(resourceName: "page3")]
        
        scrollView.contentSize.width = self.view.frame.width * CGFloat(imgArr.count)
        scrollView.frame.size = self.view.frame.size
        //scrollView.isPagingEnabled = true
        //scrollView.showsHorizontalScrollIndicator = false
        
        for n in 0..<imgArr.count {
            let imageView = UIImageView()
            imageView.image = imgArr[n]
            let xPosition = self.view.frame.width * CGFloat(n)
            imageView.frame = CGRect(x: xPosition, y: 0, width: scrollView.frame.width, height: scrollView.frame.height)
            imageView.contentMode = .scaleAspectFit
            scrollView.addSubview(imageView)
        }
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let page = scrollView.contentOffset.x / scrollView.frame.width
        pageControl.currentPage = Int(page)
        
        if page == 2 {
            UIView.animate(withDuration: 0.2, animations: { 
                self.startButton.alpha = 1
            })
        } else {
            UIView.animate(withDuration: 0.2, animations: {
                self.startButton.alpha = 0
            })
        }
    }
    

    @IBAction func getStarted(_ sender: UIButton) {
        
        let userDefaults = UserDefaults.standard
        userDefaults.set(true, forKey: "onBoardingComplete")
        userDefaults.synchronize()
        
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "getStarted")
        present(vc, animated: true, completion: nil)
    }

    

}

