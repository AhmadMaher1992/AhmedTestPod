//
//  Service.swift
//  AhmedTestPod
//
//  Created by Ahmed Maher on 18/07/2023.
//

import Foundation

public class Service {
    
    private init() {}
    
    static func print_New(class_Name: String? , method_Name: String?)
    {
        print("DEBUG:🔴 \(String(describing: class_Name)) 🔴 \(String(describing: method_Name)) 🔴")
    }
    
    static func change_View_Color(view: UIView , color: UIColor)
    {
        view.backgroundColor = color
    }
}
