//
//  ViewController.swift
//  GradientViewWithShadow
//
//  Created by Pavel Paddubotski on 1.05.23.
//

import UIKit

class ViewController: UIViewController {
    private struct Constants {
        static let viewHeightWidth: CGFloat = 120
    }
    
    private lazy var gradientView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        let gradientLayer = setGradientBackground(topColor: .blue, bottomColor: .red)
        gradientLayer.cornerRadius = 12
        gradientLayer.shadowColor = UIColor.black.cgColor
        gradientLayer.shadowOpacity = 1
        gradientLayer.shadowOffset = .zero
        gradientLayer.shadowRadius = 10
        gradientLayer.frame = CGRect(x: 0, y: 0, width: Constants.viewHeightWidth, height: Constants.viewHeightWidth)
        view.layer.insertSublayer(gradientLayer, at: 0)
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(gradientView)
        layoutView()
    }
    
    private func setGradientBackground(topColor: UIColor, bottomColor: UIColor) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = .zero
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        return gradientLayer
    }
    
    private func layoutView() {
        NSLayoutConstraint.activate([
            gradientView.heightAnchor.constraint(equalToConstant: Constants.viewHeightWidth),
            gradientView.widthAnchor.constraint(equalTo: gradientView.heightAnchor),
            gradientView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            gradientView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 100)
        ])
    }
}

