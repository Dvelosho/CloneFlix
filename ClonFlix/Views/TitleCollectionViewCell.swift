//
//  TitleCollectionViewCell.swift
//  ClonFlix
//
//  Created by daniel veloso on 04-03-25.
//

import UIKit
import SDWebImage

class TitleCollectionViewCell: UICollectionViewCell {
    
    
    static let identifier = "TitleCollectionViewCell"
    
    private let posterImageView: UIImageView = {
       
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(posterImageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        posterImageView.frame = contentView.bounds
    }
    
    public func configure(with posterPath: String) {
        let imageUrl = "https://image.tmdb.org/t/p/w500\(posterPath)"
        guard let url = URL(string: imageUrl) else { return }
        posterImageView.sd_setImage(with: url, completed: nil)
    }
    
    // Cambiar la función para aceptar un objeto Title
//    public func configure(with title: Title) {
//        if let posterPath = title.poster_path {
//            let imageUrl = "https://image.tmdb.org/t/p/w500\(posterPath)"
//            guard let url = URL(string: imageUrl) else { return }
//            posterImageView.sd_setImage(with: url, completed: nil)
//        }
//    }
    
//    public func configure(with model: String) {
//        guard let url = URL(string: model) else {return}
//        posterImageView.sd_setImage(with: url, completed: nil)
//    }
}
