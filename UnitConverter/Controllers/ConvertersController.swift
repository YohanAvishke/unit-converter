//
//  ConvertersController.swift
//  UnitConverter
//
//  Created by Yohan Avishke Ediriweera on 2021-03-12.
//

import Foundation
import UIKit

class ConvertersController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return converterViews.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
            as! ConverterViewCell
        cell.converterName.text = converterViews[indexPath.row].name
        cell.converterImage.image = converterViews[indexPath.row].image
        cell.converterDescription.text = converterViews[indexPath.row].description
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: converterViews[indexPath.row].segueID, sender: self)
    }
}
