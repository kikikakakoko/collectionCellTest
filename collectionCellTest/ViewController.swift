//
//  ViewController.swift
//  collectionCellTest
//
//  Created by Kiki on 2023/07/11.
//

import UIKit


class ViewController: UIViewController {

    var num = 0
    var delegate: collectionDelegate?
    var array = ["bat", "butter", "dragon"]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layout = UICollectionViewFlowLayout()
        let colletion = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: layout)
        colletion.backgroundColor = .brown
        view.addSubview(colletion)
        
        colletion.delegate = self
        colletion.dataSource = self
        
        colletion.register(Cell.self, forCellWithReuseIdentifier: Cell.identifier)
        delegate = self
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, collectionDelegate {
    func collectionTapped(at index: Int) {
        //print(index)
        print("delegate func")
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CELL", for: indexPath)
//        cell.backgroundColor = .gray
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.identifier, for: indexPath) as! Cell
        cell.config(say: indexPath.row)
        
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_: )))
//        cell.addGestureRecognizer(tapGesture)
//        tapGesture.numberOfTapsRequired = 1
//        cell.isUserInteractionEnabled = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print(String(indexPath.row))
        print(array[indexPath.row])
    }
    
    @objc func tapped(_: UITapGestureRecognizer) {
        print("cell tapped")
        delegate?.collectionTapped(at: num)
    }
    
}





