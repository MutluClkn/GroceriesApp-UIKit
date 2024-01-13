//
//  CategoriesView.swift
//  GroceriesApp-UIKit
//
//  Created by Mutlu Çalkan on 13.01.2024.
//

import UIKit

//MARK: - CategoriesView
class CategoriesView: UIView {
    
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
    lazy var searchBar: UISearchBar = {
       let search = UISearchBar()
        search.placeholder = Labels.Categories.searchBarPlaceholder
        search.searchBarStyle = .minimal
        search.translatesAutoresizingMaskIntoConstraints = false
        return search
    }()
    
    lazy var collectionView: UICollectionView = {
       let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.register(CategoryCardCell.self, forCellWithReuseIdentifier: Labels.CollectionViewCell.categoryCardCellIdentifier)
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
}

//MARK: - CategoriesView Extension
extension CategoriesView {
    private func setupView(){
        addSubViews(searchBar, collectionView)
    }
    
    private func style() {
        backgroundColor = .white
    }
    
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            searchBar.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 6),
            searchBar.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            searchBar.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            
            collectionView.topAnchor.constraint(equalTo: searchBar.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 6),
        ])
    }
}
