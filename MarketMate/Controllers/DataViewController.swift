//
//  DataViewController.swift
//  MarketMate
//
//  Created by Lucas Cordina on 05/04/2018.
//  Copyright © 2018 Lucas Cordina. All rights reserved.
//

import UIKit

class DataViewController: UIViewController {

    @IBOutlet weak var dataLabel: UILabel!
    var dataObject: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //start adding components
//        view.addSubview(initializeNavView())
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

//    func initializeNavView() -> UIView {
//        let navView = UIView()
//
//        navView.translatesAutoresizingMaskIntoConstraints = false
//        navView.backgroundColor = UIColor(named: "primaryColor")
//
//        navView.widthAnchor.constraint(equalToConstant: view.frame.width).isActive = true
//        navView.heightAnchor.constraint(equalToConstant: 115).isActive = true
//
//        let titleLabel = UITextView()
//        //subviews need to be added prior to adding constraints
//        titleLabel.text = "My List"
//        navView.addSubview(titleLabel)
//        titleLabel.translatesAutoresizingMaskIntoConstraints = false
//        titleLabel.textAlignment = .center
//        titleLabel.isEditable = false
//        titleLabel.isScrollEnabled = false
//        titleLabel.backgroundColor = .clear
//        titleLabel.textColor = .white
//        titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
//
//
//        titleLabel.topAnchor.constraint(equalTo: navView.topAnchor, constant:40).isActive = true
//        titleLabel.bottomAnchor.constraint(equalTo: navView.bottomAnchor, constant: 0).isActive = true
//        titleLabel.leftAnchor.constraint(equalTo: navView.leftAnchor, constant: 0).isActive = true
//        titleLabel.rightAnchor.constraint(equalTo: navView.rightAnchor, constant: 0).isActive = true
//
//
//        return navView
//    }

}
