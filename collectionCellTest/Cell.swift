//
//  Cell.swift
//  collectionCellTest
//
//  Created by Kiki on 2023/07/12.
//

import Foundation
import SpriteKit

class Cell : UICollectionViewCell {
    var array = ["bat", "butter", "dragon"]
    static let identifier = "CELL"
    var index: IndexPath!
    var collDele: collectionDelegate!
    private var title: String = ""
    
    private var sonView: UIImageView = {
//        let image = UIImage(named: "butter")
        let sonView = UIImageView()

        sonView.translatesAutoresizingMaskIntoConstraints = false
        sonView.backgroundColor = .init(displayP3Red: 0.1, green: 0.1, blue: 0.3, alpha: 0.3)
        sonView.isUserInteractionEnabled = true
        return sonView
        
    }()
    
    override func awakeFromNib() {
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_: )))
//        sonView.addGestureRecognizer(tapGesture)
//        tapGesture.numberOfTapsRequired = 1
        
    }


    func config(say: Int) {
        var image = UIImage(named: array[say])
        sonView = UIImageView(image: image)
        sonView.frame = self.contentView.frame
        print("dd")
        self.addSubview(sonView)
        addConstraints()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_: )))
        //addGestureRecognizer(tapGesture)
        tapGesture.numberOfTapsRequired = 1
        isUserInteractionEnabled = true
 
//        var tapGesture = UITapGestureRecognizer(target: self, action: #selector(tapped(_: )))
//        sonView.addGestureRecognizer(tapGesture)
//        tapGesture.numberOfTapsRequired = 1
    }
    
    @objc func tapped(_: UITapGestureRecognizer) {
        print("apped")
    }

    func addConstraints() {
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(sonView.widthAnchor.constraint(equalTo: self.widthAnchor))
        constraints.append(sonView.heightAnchor.constraint(equalTo: self.heightAnchor))
        constraints.append(sonView.bottomAnchor.constraint(equalTo: self.bottomAnchor))
        NSLayoutConstraint.activate(constraints)
    }
}
