//
//  DScrollViewContainer.swift
//  DuckUI
//
//  Created by Ahmed Maher Eisa on 07/18/2023.
// Copyright (c) 2023 Ahmed Maher Eisa. All rights reserved.

import UIKit

public class DScrollViewContainer: UIStackView {
    
    private var containerAxis: NSLayoutConstraint.Axis?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    public convenience init(axis: NSLayoutConstraint.Axis = .vertical, spacing: CGFloat = 0) {
        self.init()
        self.axis = axis
        self.spacing = spacing
        self.containerAxis = axis
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @discardableResult
    public func edgeTo(_ scrollView: UIScrollView) -> UIStackView? {
        translatesAutoresizingMaskIntoConstraints = false
        
        leadingAnchor.constraint(equalTo: scrollView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: scrollView.trailingAnchor).isActive = true
        topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
        // this is important for scrolling
        guard let containerAxis = containerAxis else { return nil }
        if containerAxis == .vertical {
            widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        } else if containerAxis == .horizontal {
            heightAnchor.constraint(equalTo: scrollView.heightAnchor).isActive = true
        }
        
        return self
    }
    
}

