//
//  HomeViewController.swift
//  TestDigio
//
//  Created by Pedro Brandão on 11/10/24.
//

import UIKit

class HomeViewController: UIViewController {
    
    private lazy var viewModel: HomeViewModelProtocol = {
        HomeViewModel(navigation: self.navigationController)
    }()
    
    private let spotLightDelegate: SpotLightCollectionDelegating = SpotLightCollectionDelegate()
    
    private lazy var productsDelegate: ProductsCollectionDelegating = {
        ProductsCollectionDelegate()
    }()
    
    @IBOutlet private weak var spotLightCollectionView: UICollectionView!
    @IBOutlet private weak var cashImageView: UIImageView!
    @IBOutlet private weak var productsCollectionView: UICollectionView!
    
    private func configuredDataSource() -> UICollectionViewDiffableDataSource<Int, TestDigioModel> {
        let nib = UINib(nibName: "DigioCollectionViewCell", bundle: nil)
        let cellReg = UICollectionView.CellRegistration<DigioCollectionViewCell, TestDigioModel>(
            cellNib: nib) { cell, _, itemIdentifier in
                cell.updateURL(itemIdentifier.url)
            }
        
        return UICollectionViewDiffableDataSource<Int, TestDigioModel>(collectionView: spotLightCollectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(using: cellReg, for: indexPath, item: item)
        }
    }
    
    lazy var datasource: UICollectionViewDiffableDataSource<Int, TestDigioModel> = { self.configuredDataSource() }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupInitialData()
        viewModel.handleViewDidLoad()
    }
    
    private func setupUI() {
        spotLightCollectionView.delegate = spotLightDelegate
        productsCollectionView.delegate = productsDelegate
    }
    
    private func setupInitialData() {
        var snap = NSDiffableDataSourceSnapshot<Int, TestDigioModel>()
        //        Nova maneira de atualizar dados
        //        snap.appendSections(["pepboys"])
        //        let pep = ["manny","moe","jack"]
        //        snap.appendItems(pep)
        snap.appendSections([0])
        let m1 = TestDigioModel(url: "https://s3-sa-east-1.amazonaws.com/digio-exame/recharge_banner.png")
        let m2 = TestDigioModel(url: "https://s3-sa-east-1.amazonaws.com/digio-exame/uber_banner.png")
        snap.appendItems([m1, m2])
        
        self.datasource.apply(snap, animatingDifferences: false)
    }
}
