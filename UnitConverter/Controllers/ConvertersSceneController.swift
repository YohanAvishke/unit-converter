//
//  ConvertersSceneController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-12.
//

import Foundation
import UIKit

class ConvertersSceneController: UIViewController, UICollectionViewDataSource,
                                 UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return converters.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            as! ConverterViewCell
        cell.conversionName.text = converters[indexPath.row].name
        cell.conversionIcon.image = converters[indexPath.row].image
        
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor(red: 0.25, green: 0.25, blue: 0.25,
                                                     alpha: 1.00).cgColor
        cell.contentView.layer.masksToBounds = false
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: converters[indexPath.row].segueID, sender: self)
    }
}
