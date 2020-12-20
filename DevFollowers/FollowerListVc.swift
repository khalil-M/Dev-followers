//
//  FollowerListVc.swift
//  DevFollowers
//
//  Created by macbook pro on 25/11/2020.
//

import UIKit

class FollowerListVc: UIViewController {
    //will be set when we pass data to it
    var username: String!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        
    }
    


}
