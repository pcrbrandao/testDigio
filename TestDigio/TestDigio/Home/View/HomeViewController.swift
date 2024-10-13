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
        let coord = HomeCoordinator(navigator: self)
        return HomeViewModel(coordinator: coord)
    }()
    
    private var cancellables: [AnyCancellable] = []
    
    @IBOutlet private weak var spotLightCollectionView: UICollectionView!
    @IBOutlet private weak var cashImageView: UIImageView!
    @IBOutlet private weak var productsCollectionView: UICollectionView!
    
    @IBAction func cashImageTapAction(_ sender: Any) {
        viewModel.handleTapOnCash()
    }
    
    private func configuredSpotLightDataSource() -> UICollectionViewDiffableDataSource<Int, SpotLightModel> {
        let nib = UINib(nibName: "DigioCollectionViewCell", bundle: nil)
        let cellReg = UICollectionView.CellRegistration<DigioCollectionViewCell, SpotLightModel>(
            cellNib: nib) { cell, _, itemIdentifier in
                cell.updateURL(itemIdentifier.bannerURL)
                cell.setModel(itemIdentifier)
                cell.setTapHandler(self.viewModel)
            }
        // swiftlint:disable all
        return UICollectionViewDiffableDataSource<Int, SpotLightModel>(collectionView: self.spotLightCollectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(using: cellReg, for: indexPath, item: item)
        }
        // swiftlint:enable all
    }
    
    private func configuredProductsDataSource() -> UICollectionViewDiffableDataSource<Int, ProductModel> {
        let nib = UINib(nibName: "DigioCollectionViewCell", bundle: nil)
        let cellReg = UICollectionView.CellRegistration<DigioCollectionViewCell, ProductModel>(
            cellNib: nib) { cell, _, itemIdentifier in
                cell.updateURL(itemIdentifier.imageURL)
                cell.setModel(itemIdentifier)
                cell.setTapHandler(self.viewModel)
            }
        
        return UICollectionViewDiffableDataSource<Int, ProductModel>(collectionView: self.productsCollectionView) { collectionView, indexPath, item in
            collectionView.dequeueConfiguredReusableCell(using: cellReg, for: indexPath, item: item)
        }
    }
    
    private lazy var spotLightDatasource: UICollectionViewDiffableDataSource<Int, SpotLightModel> = {
        self.configuredSpotLightDataSource()
    }()
    
    private lazy var productsDataSource: UICollectionViewDiffableDataSource<Int, ProductModel> = {
        self.configuredProductsDataSource()
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupInitialData()
        viewModel.handleViewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        viewModel.handlePrepareSegue(destination: segue.destination)
    }
    
    private func setupUI() {
        viewModel.newSpotLightDataSub
            .sink {
                self.update(dataSource: self.spotLightDatasource, with: $0)
            }
            .store(in: &cancellables)
        
        viewModel.newCashDataSub
            .sink {
                self.cashImageView.sd_setImage(with: URL(string: $0.bannerURL))
            }
            .store(in: &cancellables)
        
        viewModel.newProductsDataSub
            .sink { self.update(dataSource: self.productsDataSource, with: $0)
            }
            .store(in: &cancellables)
    }
    
    // Nova maneira de atualizar dados
    private func update<Model>(dataSource: UICollectionViewDiffableDataSource<Int, Model>, with list: [Model]) {
        var snap = NSDiffableDataSourceSnapshot<Int, Model>()
        snap.appendSections([0])
        snap.appendItems(list)
        dataSource.apply(snap, animatingDifferences: true)
    }
    
    private func setupInitialData() {
        update(dataSource: spotLightDatasource, with: [])
    }
}
