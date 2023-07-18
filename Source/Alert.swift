//
//  Alert.swift
//  AhmedTestPod
//
//  Created by Ahmed Maher on 18/07/2023.
//


import UIKit


enum AlertAction{
    case Ok
    case Cancel
}

typealias AlertCompletionHandler = ((_ index:AlertAction)->())?
typealias AlertCompletionHandlerInt = ((_ index:Int)->())

class Alert{
    
    private var alertWindow: UIWindow
    static var shared = Alert()
    
    init() {
        alertWindow = UIWindow(frame: UIScreen.main.bounds)
        alertWindow.rootViewController = UIViewController()
        alertWindow.windowLevel = UIWindow.Level.alert + 1
        alertWindow.makeKeyAndVisible()
        alertWindow.isHidden = true
    }
    
    //MARK: - Single button with default titles (OK) , without handler block
    func showAlert(title:String?, message:String?){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
            alert.addAction(UIAlertAction(title: "Ok", style:.default, handler:{(alert) in
                self.alertWindow.isHidden = true
                }))
            self.alertWindow.isHidden = false
            self.alertWindow.rootViewController?.present(alert, animated: false)
        }
    }
    
    //MARK: - Two buttons with default titles (OK , CANCEL)
    func showAlertWithHandler(title:String?, message:String?, handler:AlertCompletionHandler){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
            alert.addAction(UIAlertAction(title:"Ok", style:.default, handler: { (alert) in
                self.alertWindow.isHidden = true
                handler?(AlertAction.Ok)
            }))
            
            alert.addAction(UIAlertAction(title:"Cancle", style:.default, handler: { (alert) in
                self.alertWindow.isHidden = true
                handler?(AlertAction.Cancel)
            }))
            
            self.alertWindow.isHidden = false
            self.alertWindow.rootViewController?.present(alert, animated: false)
        }
    }
    
    //MARK: - Single button with custom titles
    func showAlertWithHandler(title:String?, message:String?, okButtonTitle:String, handler:AlertCompletionHandler){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
            alert.addAction(UIAlertAction(title:okButtonTitle, style:.default, handler: { (alert) in
                self.alertWindow.isHidden = true
                handler?(AlertAction.Ok)
            }))
            
            self.alertWindow.isHidden = false
            self.alertWindow.rootViewController?.present(alert, animated: false)
        }
    }
    
    //MARK: - Two buttons with custom titles
    func showAlertWithHandler(title:String?, message:String?, okButtonTitle:String, cancelButtionTitle:String,handler:AlertCompletionHandler){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle:.alert)
            alert.addAction(UIAlertAction(title:okButtonTitle, style:.default, handler: { (alert) in
                self.alertWindow.isHidden = true
                handler?(AlertAction.Ok)
            }))
            
            alert.addAction(UIAlertAction(title:cancelButtionTitle, style:.default, handler: { (alert) in
                self.alertWindow.isHidden = true
                handler?(AlertAction.Cancel)
            }))
            
            self.alertWindow.isHidden = false
            self.alertWindow.rootViewController?.present(alert, animated: false)
        }
    }
    
    //MARK: - Actionsheet / Alert => Multiple buttons with custom titles
    func showAlertWithHandler(title:String?, message:String?, buttonsTitles:[String], showAsActionSheet: Bool,handler:@escaping AlertCompletionHandlerInt){
        
        DispatchQueue.main.async {
            let alert = UIAlertController(title:title, message: message, preferredStyle: (showAsActionSheet ?.actionSheet : .alert))
            
            for btnTitle in buttonsTitles{
                alert.addAction(UIAlertAction(title:btnTitle, style:.default, handler: { (alert) in
                    self.alertWindow.isHidden = true
                    handler(buttonsTitles.firstIndex(of: btnTitle)!)
                }))
            }
            
            //let topVC = UIApplication.topViewController()
            //topVC?.present(alert, animated: true)
            self.alertWindow.isHidden = false
            self.alertWindow.rootViewController?.present(alert, animated: false)
        }
    }
    
    func showAlertWithHandler(title:String?, message:String?, buttonsTitles:[String], showAsActionSheet: Bool, distructiveButtonIndex:Int, cancelButtonIndex:Int, handler:@escaping AlertCompletionHandlerInt){
        
        DispatchQueue.main.async {

            let alert = UIAlertController(title:title, message: message, preferredStyle: (showAsActionSheet ?.actionSheet : .alert))
            
            var index = 0
            for btnTitle in buttonsTitles{
                
                var actionStyle = UIAlertAction.Style.default
                
                if(index == distructiveButtonIndex){
                    actionStyle = UIAlertAction.Style.destructive
                }
                else if(index == cancelButtonIndex){
                    actionStyle = UIAlertAction.Style.cancel
                }
                
                alert.addAction(UIAlertAction(title:btnTitle, style:actionStyle, handler: { (alert) in
                    self.alertWindow.isHidden = true
                    handler(buttonsTitles.firstIndex(of: btnTitle)!)
                }))
                index = index+1
            }
            
            self.alertWindow.isHidden = false
            self.alertWindow.rootViewController?.present(alert, animated: false)
        }
    }
}
