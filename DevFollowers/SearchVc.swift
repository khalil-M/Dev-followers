//
//  SearchVc.swift
//  DevFollowers
//
//  Created by macbook pro on 15/11/2020.
//

import UIKit

class SearchVc: UIViewController {
    
    let logoImageView = UIImageView()
    let usernameTextField = GFTextfield()
    let callToActionButtom = GFButton(backgroudColor: .systemGreen, title: "Get Followers")
    //a computed proprty
    var isUsernameEntred: Bool {
        return !usernameTextField.text!.isEmpty
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        configureLogoImageView()
        configureTextField()
        configureCallToActionButton()
        dismissKeyboardTapGesture()
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
    
    func configureLogoImageView(){
        view.addSubview(logoImageView)
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        logoImageView.image = UIImage(named: "gh-logo")!
        
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImageView.heightAnchor.constraint(equalToConstant: 200), logoImageView.widthAnchor.constraint(equalToConstant: 200)
            
        ])
    }
    
    func dismissKeyboardTapGesture() {
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
    }
    
    @objc func pushFollowerListVc(){
        
        guard isUsernameEntred else {
            presentGFAlertOnMainThread(title: "Empty username", message: "Please enter a username. we need to know who to look for 😀.", buttonTitle: "OK")
            return}
        let followerListVc = FollowerListVc()
        followerListVc.username = usernameTextField.text
        followerListVc.title = usernameTextField.text
        navigationController?.pushViewController(followerListVc, animated: true)
    }
    
    func configureTextField(){
        view.addSubview(usernameTextField)
       
        usernameTextField.delegate = self
        NSLayoutConstraint.activate([
            usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48), usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), usernameTextField.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    func configureCallToActionButton(){
        view.addSubview(callToActionButtom)
        callToActionButtom.addTarget(self, action: #selector(pushFollowerListVc), for: .touchUpInside)
        NSLayoutConstraint.activate([
            callToActionButtom.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50), callToActionButtom.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50), callToActionButtom.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50), callToActionButtom.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    

}

extension SearchVc: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // navigate from go buton in keyboard
       pushFollowerListVc()
        return true
    }
}
