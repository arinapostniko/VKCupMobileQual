//
//  ViewController.swift
//  VKCupMobileQual
//
//  Created by Arina Postnikova on 6.12.22.
//

import UIKit

class TopicsViewController: UIViewController {
    
    // MARK: - Public properties
    let defaultCollectionViewSpacing: CGFloat = 8
    var topicsPerLine: CGFloat = 2
    
    var topics: [String] = [
        "Юмор",
        "Еда",
        "Кино",
        "Рестораны",
        "Прогулки",
        "Политика",
        "Новости",
        "Автомобили",
        "Сериалы",
        "Рецепты",
        "Работа",
        "Отдых",
        "Спорт"
    ]
    
    // MARK: - IBOutlets
    @IBOutlet weak var laterButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupLaterButton()
        setupCollectionView()
    }
    
    // MARK: - Private methods
    private func setupLaterButton() {
        laterButton.alpha = 0.9
    }
    
    private func setupCollectionView() {
        collectionView.register(TopicsCollectionViewCell.nib(), forCellWithReuseIdentifier: TopicsCollectionViewCell.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
}

// MARK: - UICollectionView
extension TopicsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    }

    // MARK: UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopicsCollectionViewCell.identifier, for: indexPath) as? TopicsCollectionViewCell else { return UICollectionViewCell() }

        cell.setup(with: topics[index])

        return cell
    }

    // MARK: UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let index = indexPath.item
        return CGSize(width: topics[index].size(withAttributes: [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 17)]).width + 25, height: 30)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return defaultCollectionViewSpacing
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return defaultCollectionViewSpacing
    }
}

