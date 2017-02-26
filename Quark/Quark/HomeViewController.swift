//
//  HomeViewController.swift
//  Quark
//
//  Created by Pujan Tandukar on 2/25/17.
//  Copyright © 2017 Flechettes. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray;
        self.navigationController?.isNavigationBarHidden = true
        setUpUIView()
        
        let newProjectButton: UIButton = UIButton()
        newProjectButton.frame.size = CGSize(width: 200, height: 50)
        newProjectButton.backgroundColor = UIColor.gray
        newProjectButton.setTitle("Create New Project", for: .normal)
        newProjectButton.addTarget(self, action: #selector(showTextView), for: .touchUpInside)
        newProjectButton.tag = 1
        newProjectButton.center.x = self.view.center.x
        newProjectButton.center.y = self.view.center.y
        self.view.addSubview(newProjectButton)
        
        let openRecentLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        openRecentLabel.center.x = self.view.center.x
        openRecentLabel.center.y = self.view.center.y + 40
        openRecentLabel.textAlignment = .center
        openRecentLabel.text = "Open Recent File"
        openRecentLabel.textColor = .white
        self.view.addSubview(openRecentLabel)
        
        
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = true
    }

    let homeView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    func setUpButton(){
        homeView.anchor(view.topAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
    }
    
    func setUpUIView(){
        let newProjectButton = UIButton(type: .system)
        self.view.addSubview(newProjectButton)
        
    }
    
    func buttonAction(sender: UIButton!) {
        showTextView()
    }
    
    func showTextView() {
        let newView = TextViewController()
        navigationController?.pushViewController(newView, animated: true)
    }
    
//    
//    func hideNavBar(){
////        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
//        navigationController?.navigationBar.backgroundColor = .clear
//        navigationController?.navigationBar.barTintColor = .clear
////        navigationController?.navigationBar.isTranslucent = true
////        navigationController?.navigationBar.shadowImage = UIImage()
//    }
//    

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
