//
//  UIViewController+Ext.swift
//  DevFollowers
//
//  Created by macbook pro on 08/12/2020.
//

import UIKit

extension UIViewController{
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVc = GFAlertVc(title: title, message: message, buttonTitle: buttonTitle)
            alertVc.modalPresentationStyle = .overFullScreen
            alertVc.modalTransitionStyle = .crossDissolve
            self.present(alertVc, animated: true, completion: nil)
        }
    }
}
