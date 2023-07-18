//
//  ViewController.swift
//  AhmedTestPod
//
//  Created by Ahmed Maher Eisa on 07/18/2023.
//  Copyright (c) 2023 Ahmed Maher Eisa. All rights reserved.
//

import UIKit
import AhmedTestPod


class ViewController: UIViewController {

    let scrollView = DScrollView()
    let scrollViewContainer = DScrollViewContainer(axis: .vertical, spacing: 10)
    let scrollViewElement0 = DScrollViewElement(height: 1200, backgroundColor: .purple)
    let scrollViewElement1 = DScrollViewElement(height: 500, backgroundColor: .purple)//.withBackground(image: #imageLiteral(resourceName: "icon.png"), contentMode: .scaleAspectFit)
    
    let label = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        label.text = "My New Pod"
        
        view.addScrollView(scrollView,
                           withSafeArea: .none,
                           hasStatusBarCover: true,
                           statusBarBackgroundColor: .white,
                           container: scrollViewContainer,
                           elements: scrollViewElement0, scrollViewElement1)
        
        scrollViewElement1.addSubview(label)
        label.edgeTo(scrollViewElement1)
    }

}

