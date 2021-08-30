//
//  ViewController.swift
//  UIStackViewDemo
//
//  Created by 後藤孝輔 on 2021/08/30.
//

import UIKit

class ViewController: UIViewController {
    
    let topView: UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.accessibilityIdentifier = "top"
        return view
    }()
    
    let middleView: UIView = {
        let view = UIView()
        view.backgroundColor = .yellow
        view.accessibilityIdentifier = "middle"
        return view
    }()
    
    let bottomView: UIView = {
        let view = UIView()
        view.backgroundColor = .black
        view.accessibilityIdentifier = "bottom"
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .purple
        
        let stack = UIStackView(arrangedSubviews: [topView, middleView, bottomView])
        stack.distribution = .fill
        stack.axis = .vertical
        stack.alignment = .fill
        stack.accessibilityIdentifier = "stack"
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        
        [
            stack.topAnchor.constraint(equalTo: view.topAnchor),
            stack.leftAnchor.constraint(equalTo: view.leftAnchor),
            stack.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stack.rightAnchor.constraint(equalTo: view.rightAnchor)
        ].forEach { $0.isActive = true }
        
        stack.divide(parentHeight: stack.heightAnchor, by: [3,1,6])
        
        
    }
    
}

extension UIStackView {
    func divide(parentHeight: NSLayoutDimension, by ratio: [CGFloat]) {
        translatesAutoresizingMaskIntoConstraints = false
        for (view, element) in zip(arrangedSubviews, ratio) {
            view.heightAnchor.constraint(equalTo: parentHeight,
                                         multiplier: element/ratio.reduce(0, +)).isActive = true
        }
    }
}

