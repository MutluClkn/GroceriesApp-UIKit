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
        welcomeView.didTapStart = { [weak self] in
            guard let self = self else {return}
            self.router.pushCategoriesViewController()
        }
    }
    
    private func layout(){
        welcomeView.pinToEdges(of: view)
    }
    
}
