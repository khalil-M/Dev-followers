//
//  GFAlertVc.swift
//  DevFollowers
//
//  Created by macbook pro on 25/11/2020.
//

import UIKit

class GFAlertVc: UIViewController {
    
    let containerView = UIView()
    let titleLabel = GFTitleLabel(textAlignment: .center, fontsize: 20)
    let messageLabel = GFBodyLabel(textAlignment: .center)
    let actionButon = GFButton(backgroudColor: .systemPink, title: "OK")
    
    var alert: String?
    var message: String?
    var butonTitle: String?
    
    let padding: CGFloat = 20
    
    init(title: String, message: String, buttonTitle: String){
        super.init(nibName: nil, bundle: nil)
        self.alert = title
        self.message = message
        self.butonTitle = buttonTitle
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.75)
        configureContatinerView()
        configureTitleLabel()
        configureActionButton()
        configureMessageLabel()
    }
    
    func configureContatinerView(){
        view.addSubview(containerView)
        containerView.backgroundColor = .systemBackground
        containerView.layer.cornerRadius = 16
        containerView.layer.borderWidth = 2
        containerView.layer.borderColor = UIColor.white.cgColor
        containerView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor), containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor)])
    }
    
    func configureTitleLabel(){
        containerView.addSubview(titleLabel)
        titleLabel.text = alert ?? "Somethig went wrong"
        
        NSLayoutConstraint.activate([titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding), titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding), titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding), titleLabel.heightAnchor.constraint(equalToConstant: 28)])
    }
    
    func configureActionButton(){
        containerView.addSubview(actionButon)
        actionButon.setTitle(butonTitle ?? "OK", for: .normal)
        actionButon.addTarget(self, action: #selector(dismissVc), for: .touchUpInside)
        
        NSLayoutConstraint.activate([actionButon.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding), actionButon.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding), actionButon.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding), actionButon.heightAnchor.constraint(equalToConstant: 44)])
    }
    
    func configureMessageLabel(){
        containerView.addSubview(messageLabel)
        messageLabel.text = message ?? ""
        messageLabel.numberOfLines = 4
        NSLayoutConstraint.activate([messageLabel.bottomAnchor.constraint(equalTo: actionButon.topAnchor, constant: -12), messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding), messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding), messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)])
        
    }
    
    @objc func dismissVc(){
        dismiss(animated: true, completion: nil)
    }
    

}
