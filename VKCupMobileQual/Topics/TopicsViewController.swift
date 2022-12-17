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
    
    var selectedIndex: Int?
    
    // MARK: - Private properties
    private let alignedFlowLayout = AlignedCollectionViewFlowLayout(horizontalAlignment: .left, verticalAlignment: .top)
    
    private let deselectedColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.17)
    private let selectedColor = UIColor(red: 1, green: 0.325, blue: 0.09, alpha: 1)
    
    // MARK: - IBOutlets
    @IBOutlet weak var laterButton: UIButton!
    @IBOutlet weak var proceedButton: UIButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: - Override methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupButtons()
        setupCollectionView()
    }
    
    // MARK: - Private methods
    private func setupButtons() {
        laterButton.alpha = 0.9
        proceedButton.isHidden = true
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
        let index = indexPath.row
        let cell = collectionView.cellForItem(at: indexPath) as? TopicsCollectionViewCell
        if selectedIndex == index {
            selectedIndex = nil
            // unselect code here
            UIView.animate(withDuration: 0.2) {
                cell?.secondImageView.isHidden = true
            }
            UIView.animate(withDuration: 0.4) {
                cell?.backgroundColor = self.deselectedColor
                cell?.imageView.isHidden = false
            }
        } else {
            selectedIndex = index
            // select code here
            UIView.animate(withDuration: 0.2) {
                cell?.imageView.isHidden = true
            }
            UIView.animate(withDuration: 0.4) {
                cell?.backgroundColor = self.selectedColor
                cell?.secondImageView.isHidden = false
                self.proceedButton.isHidden = false
            }
        }
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

