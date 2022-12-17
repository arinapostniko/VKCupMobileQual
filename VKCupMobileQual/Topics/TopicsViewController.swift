//
//  ViewController.swift
//  VKCupMobileQual
//
//  Created by Arina Postnikova on 6.12.22.
//

import UIKit
import AlignedCollectionViewFlowLayout

class TopicsViewController: UIViewController {
    
    // MARK: - Public properties
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
    
    // MARK: - Private properties
    let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
    
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
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = alignedFlowLayout
    }
}

// MARK: - UICollectionView
extension TopicsViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    // MARK: UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        topics.count
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // TODO: Make clickable
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
        let myAttribute = [ NSAttributedString.Key.font: UIFont(name: "SF Pro Text Semibold", size: 16.0)! ]
        return CGSize(width: topics[index].size(withAttributes: myAttribute).width + 70, height: 40)
    }
}

