//
//  WelcomeViewController.swift
//  GroceriesApp-UIKit
//
//  Created by Mutlu Çalkan on 12.01.2024.
//

import UIKit

//MARK: - WelcomeViewController
class WelcomeViewController: UIViewController {
    
    private var welcomeView = WelcomeView()
    
    var router : Router
    
    init(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setup()
        layout()
    }
    
    private func setup(){
        view.addSubview(welcomeView)
    }
    
    private func layout(){
        welcomeView.pinToEdges(of: view)
    }
    
}

//MARK: - WelcomeView
//UI seperated from WelcomeViewController and created under WelcomeView class
class WelcomeView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        style()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        return CGSize(width: UIView.noIntrinsicMetric, height: UIView.noIntrinsicMetric)
    }
    
    //UI Components
    private lazy var backgroundImage: UIImageView = {
        let imageView = UIImageView(image: Images.Welcome.background)
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var logoImage: UIImageView = {
        let imageView = UIImageView(image: Images.Welcome.logo)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 42, weight: .bold)
        label.text = Labels.Welcome.titleText
        label.textColor = .white
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = Labels.Welcome.descriptionText
        label.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        label.textColor = .description
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var startButton: UIButton = {
       let button = UIButton()
        button.backgroundColor = .primary
        button.setTitle(Labels.Welcome.startButtonText, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        button.layer.cornerRadius = 12
        button.tintColor = .white
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(didTapStartButton), for: .touchUpInside)
        return button
    }()
    
    
    //Start Button Target
    @objc func didTapStartButton(){
        
    }
}

//MARK: - WelcomeView Extension
extension WelcomeView {
    private func setupView(){
        addSubViews(backgroundImage, logoImage, titleLabel, descriptionLabel, startButton)
    }
    
    private func style() {
        backgroundColor = .blue
    }
    
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        backgroundImage.pinToEdges(of: self)
        
        NSLayoutConstraint.activate([
            startButton.heightAnchor.constraint(equalToConstant: 67),
            startButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            startButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            startButton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -90),
            
            descriptionLabel.bottomAnchor.constraint(equalTo: startButton.topAnchor, constant: -40),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            
            titleLabel.bottomAnchor.constraint(equalTo: descriptionLabel.topAnchor, constant: -19),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 80),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -80),
            
            logoImage.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: -35),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
        ])
        
    }
}



