//
//  ViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit


class HomeViewController: UIViewController {
    
    struct palette {
        static let red = UIColor(red:0.85, green:0.44, blue:0.44, alpha:1.0)
        static let blue = UIColor(red:0.46, green:0.60, blue:0.96, alpha:1.0)
        static let green = UIColor(red:0.64, green:0.76, blue:0.64, alpha:1.0)
        static let pink = UIColor(red:0.89, green:0.75, blue:0.75, alpha:1.0)
        static let yellow = UIColor(red:0.95, green:0.91, blue:0.64, alpha:1.0)
        static let orange = UIColor(red:0.96, green:0.74, blue:0.50, alpha:1.0)
        struct gray {
            static let light = UIColor(red:0.80, green:0.79, blue:0.79, alpha:1.0)
            static let medium = UIColor(red:0.51, green:0.47, blue:0.50, alpha:1.0)
            static let dark = UIColor(red:0.18, green:0.18, blue:0.20, alpha:1.0)
            static let veryDark = UIColor(red:0.12, green:0.12, blue:0.14, alpha:1.0)
        }
    }
    
    let homeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(homeView)
        setUpNavigationBar()
        setupHomeView()
    }
    
    func setUpNavigationBar() {
        navigationController?.navigationBar.backgroundColor = .lightGray
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        
        let homeButton = UIBarButtonItem(title: "Home", style: .plain, target: self, action: #selector(pushTextEditor))
        homeButton.tintColor = .gray
        navigationItem.leftBarButtonItems = [homeButton]
        
//        let homeButton = UIButton(type: .system)
//        homeButton.setTitle("Home", for: .normal)
//        homeButton.frame = CGRect(x: 0, y: 0, width: 50, height: 34)
//        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: homeButton)
//        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: UIButton())
        
        let titleImageView = UIImageView(image: #imageLiteral(resourceName: "quark_logo"))
        titleImageView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        titleImageView.contentMode = .scaleAspectFit
        navigationItem.titleView = titleImageView
        
    }
    
    func pushTextEditor() {
        print("home view")
        let newView = TextViewController()
        present(newView, animated: true)
    }
    
    func setupHomeView() {
        homeView.backgroundColor = palette.gray.veryDark
        homeView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    


}

