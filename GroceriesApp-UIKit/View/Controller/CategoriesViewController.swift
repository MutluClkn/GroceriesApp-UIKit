//
//  CategoriesViewController.swift
//  GroceriesApp-UIKit
//
//  Created by Mutlu Çalkan on 13.01.2024.
//

import UIKit

//MARK: - CategoriesViewController
class CategoriesViewController: UIViewController {
    
    private let categoriesView = CategoriesView()
    private let viewModel = CategoriesViewModel()
    
    var router: Router
    
    init(router: Router) {
        self.router = router
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        setupNavController()
    }
    
    private func setup(){
        view.addSubview(categoriesView)
        categoriesView.collectionView.delegate = self
        categoriesView.collectionView.dataSource = self
    }
    
    private func layout(){
        categoriesView.pinToEdges(of: view)
    }
    
    private func setupNavController(){
        title = "Find Products"
        navigationItem.setHidesBackButton(true, animated: false)
    }
}


//MARK: - CollectionViewDelegate, DataSource & DelegateFlowLayout
extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.categoriesList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Labels.CollectionViewCell.categoryCardCellIdentifier, for: indexPath) as? CategoryCardCell else {return UICollectionViewCell()}
        
        let item = viewModel.categoriesList[indexPath.row]
        cell.model = item
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160, height: 180)
    }
    
}

//MARK: - CategoryCardModel
struct CategoryCardModel {
    let title : String
    let image : UIImage
    let backgroundColor : UIColor
    let borderColor: UIColor
}

//MARK: - CategoryCardCell
class CategoryCardCell: UICollectionViewCell {
    
    var model: CategoryCardModel? {
        didSet{
            bind()
        }
    }
    
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
    private let imageView: UIImageView = {
       let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
       let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
}

//MARK: - CategoryCardCell Extension
extension CategoryCardCell {
    
    private func setupView(){
        contentView.addSubViews(imageView, titleLabel)
    }
    
    private func style() {
        layer.cornerRadius = 12
        layer.borderWidth = 2
        
    }
    
    private func layout() {
        translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 32),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            imageView.heightAnchor.constraint(equalToConstant: 70),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
       
    }
    
    func bind() {
        guard let model = model else { return }
        imageView.image = model.image
        titleLabel.text = model.title
        backgroundColor = model.backgroundColor
        layer.borderColor = model.borderColor.cgColor
    }
}
