//
//  CategoriesViewModel.swift
//  GroceriesApp-UIKit
//
//  Created by Mutlu Çalkan on 13.01.2024.
//

import UIKit

struct CategoriesViewModel {
    let categoriesList: [CategoryCardModel] =
    [
        .init(title: Labels.Categories.frashFruitsAndVegetable, image: Images.Category.fruitsVegs, backgroundColor: UIColor.Cards.fruitVeg, borderColor: UIColor.Cards.fruitVeg),
        .init(title: Labels.Categories.beverages, image: Images.Category.beverages, backgroundColor: UIColor.Cards.beverage, borderColor: UIColor.Cards.beverage),
        .init(title: Labels.Categories.bakeryAndSnacks, image: Images.Category.bakery, backgroundColor: UIColor.Cards.bakery, borderColor: UIColor.Cards.bakery),
        .init(title: Labels.Categories.cookingOilAndGhee, image: Images.Category.oils, backgroundColor: UIColor.Cards.oils, borderColor: UIColor.Cards.oils),
        .init(title: Labels.Categories.dairyAndEggs, image: Images.Category.dairyEggs, backgroundColor: UIColor.Cards.dairyEggs, borderColor: UIColor.Cards.dairyEggs),
        .init(title: Labels.Categories.meatAndFish, image: Images.Category.meatFish, backgroundColor: UIColor.Cards.meatFish, borderColor: UIColor.Cards.meatFish),
        .init(title: Labels.Categories.cookingOilAndGhee, image: Images.Category.oils, backgroundColor: UIColor.Cards.oils, borderColor: UIColor.Cards.oils),
        .init(title: Labels.Categories.dairyAndEggs, image: Images.Category.dairyEggs, backgroundColor: UIColor.Cards.dairyEggs, borderColor: UIColor.Cards.dairyEggs),
        .init(title: Labels.Categories.meatAndFish, image: Images.Category.meatFish, backgroundColor: UIColor.Cards.meatFish, borderColor: UIColor.Cards.meatFish),
        .init(title: Labels.Categories.beverages, image: Images.Category.beverages, backgroundColor: UIColor.Cards.beverage, borderColor: UIColor.Cards.beverage)
    ]
}
