//
//  DScrollView.swift
//  DuckUI
//
//  Created by Ahmed Maher Eisa on 07/18/2023.
// Copyright (c) 2023 Ahmed Maher Eisa. All rights reserved.

import UIKit

public class DScrollView: UIScrollView {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        keyboardDismissMode = .interactive
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
