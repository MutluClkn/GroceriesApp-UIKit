//
//  Router.swift
//  GroceriesApp-UIKit
//
//  Created by Mutlu Çalkan on 12.01.2024.
//

import UIKit

final class Router {
    let navigation: UINavigationController
    
    init(navigation: UINavigationController) {
        self.navigation = navigation
    }
    
    private func push(controller: UIViewController){
        navigation.pushViewController(controller, animated: true)
    }
    
    private func pop(){
        navigation.popViewController(animated: true)
    }
}
