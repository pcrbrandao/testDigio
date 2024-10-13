//
//  HomeViewController.swift
//  TestDigio
//
//  Created by Pedro Brandão on 11/10/24.
//

import Combine
import UIKit

class HomeViewController: UIViewController {
    
    private lazy var viewModel: HomeViewModelProtocol = {
        HomeViewModel(navigation: self.navigationController)
    }()
    
    private let spotLightDelegate: SpotLightCollectionDelegating = SpotLightCollectionDelegate()
    private let productsDelegate: ProductsCollectionDelegating = ProductsCollectionDelegate()
    private var cancellables: [AnyCancellable] = []
    
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
    
    private lazy var spotLightDatasource: UICollectionViewDiffableDataSource<Int, TestDigioModel> = {
        self.configuredDataSource()
    }()
    
    private lazy var productsDataSource: UICollectionViewDiffableDataSource<Int, TestDigioModel> = {
        self.configuredDataSource()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupInitialData()
        viewModel.handleViewDidLoad()
    }
    
    private func setupUI() {
        spotLightCollectionView.delegate = spotLightDelegate
        productsCollectionView.delegate = productsDelegate
        
        viewModel.newSpotLightDataSub
            .sink {
                self.update(dataSource: self.spotLightDatasource, with: $0)
            }
            .store(in: &cancellables)
        
        viewModel.newProductsDataSub
            .sink { self.update(dataSource: self.spotLightDatasource, with: $0)
            }
            .store(in: &cancellables)
        
        viewModel.newCashDataSub
            .sink { self.cashImageView.sd_setImage(with: URL(string: $0.url))
            }
            .store(in: &cancellables)
    }
    
    // Nova maneira de atualizar dados
    private func update(dataSource: UICollectionViewDiffableDataSource<Int, TestDigioModel>, with list: [TestDigioModel]) {
        guard !list.isEmpty else { return }
        var snap = NSDiffableDataSourceSnapshot<Int, TestDigioModel>()
        snap.appendSections([0])
        snap.appendItems(list)
        dataSource.apply(snap, animatingDifferences: true)
    }
    
    private func setupInitialData() {
        update(dataSource: spotLightDatasource, with: [])
    }
}
