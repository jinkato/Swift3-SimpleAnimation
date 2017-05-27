//
//  ViewController.swift
//  SimpleAnimation
//
//  Created by Jin Kato on 5/13/17.
//  Copyright © 2017 Jin Kato. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: Properties
    
    let blueView:UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let redView:UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    let blueButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("blue", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleAnimateBlue), for: UIControlEvents.touchUpInside)
        return button
    }()
    let redButton:UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("red", for: .normal)
        button.setTitleColor(.blue, for: .normal)
        button.backgroundColor = .white
        button.addTarget(self, action: #selector(handleAnimateRed), for: UIControlEvents.touchUpInside)
        return button
    }()
    var blueHeight:NSLayoutConstraint?
    var redWidth:NSLayoutConstraint?
    var blueAnimated = false
    var redAnimated = false
    
    //MARK: Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutBlueView()
        layoutRedView()
        layoutRedButton()
        layoutBlueButton()
    }
    
    //MARK: Handle
    
    func handleAnimateBlue(){
        blueAnimated = !blueAnimated
        if blueAnimated {
            blueButton.setTitle("blue open", for: .normal)
        }else{
            blueButton.setTitle("blue close", for: .normal)
        }
        view.layoutIfNeeded()
        
        blueHeight?.constant = blueAnimated ? 300 : 100
        UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 50, options: [], animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
    func handleAnimateRed(){
        redAnimated = !redAnimated
        redWidth?.isActive = false
        if redAnimated {
            redWidth = redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        }else{
            redWidth = redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        }
        redWidth?.isActive = true
        
        UIView.animate(withDuration: 1.3, delay: 0, options: UIViewAnimationOptions.curveEaseInOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
        
    }
    
    //MARK: Helper
    
    func layoutRedView(){
        view.addSubview(redView)
        redView.topAnchor.constraint(equalTo: blueView.bottomAnchor, constant: 10).isActive = true
        redView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -10).isActive = true
        redView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        redWidth = redView.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.9)
        redWidth?.isActive = true
    }
    func layoutBlueView(){
        view.addSubview(blueView)
        blueView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        blueView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blueView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        blueHeight = blueView.heightAnchor.constraint(equalToConstant: 100)
        blueHeight?.isActive = true
    }
    func layoutRedButton(){
        view.addSubview(redButton)
        redButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        redButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        redButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        redButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }
    func layoutBlueButton(){
        view.addSubview(blueButton)
        blueButton.heightAnchor.constraint(equalToConstant: 70).isActive = true
        blueButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5).isActive = true
        blueButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        blueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
    }

}

