//
//  MoviesView.swift
//  Movies
//
//  Created by İrem Sever on 12.10.2024.
//
import Foundation
import UIKit

class MoviesView: UIViewController, UICollectionViewDelegate {

    private var moviesCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 20
        layout.minimumInteritemSpacing = 0
        layout.itemSize = CGSize(width: 300, height: 420)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(MoviesCellView.self, forCellWithReuseIdentifier: "MoviesCellView")
        collectionView.backgroundColor = .clear
        collectionView.decelerationRate = .normal
        collectionView.showsHorizontalScrollIndicator = false
        return collectionView
    }()

    var presenter: MoviesPresentable?
    private var movies: [MovieViewModel] = []

    init(presenter: MoviesPresentable) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var router: DetailRouting?

    func didSelectMovie(movieId: String) {
        // Ensure router is properly initialized before calling navigate
        //router?.navigate(to: DetailMoviesPresenter(movieId: movieId))
    }


        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = UIColor.black
            setupCollectionView()
            
            Task {
                await presenter?.onViewAppear() // Asynchronous operation
            }
        }

        private func setupCollectionView() {
            view.addSubview(moviesCollectionView)

            moviesCollectionView.dataSource = self
            moviesCollectionView.delegate = self // Make sure delegate is set

            NSLayoutConstraint.activate([
                moviesCollectionView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                moviesCollectionView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                moviesCollectionView.widthAnchor.constraint(equalTo: view.widthAnchor),
                moviesCollectionView.heightAnchor.constraint(equalToConstant: 400)
            ])
        }

}

// UICollectionViewDataSource implementasyonu
extension MoviesView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(movies.count)
        return movies.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MoviesCellView", for: indexPath) as? MoviesCellView else {
            return UICollectionViewCell()
        }
        let movie = movies[indexPath.item]
        cell.configure(model: movie)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.onTapCell(atIndex: indexPath.item)
    }
}

// MoviesPresenterUI implementasyonu
extension MoviesView: MoviesPresenterUI {
    func update(movies: [MovieViewModel]) {
        self.movies = movies
        DispatchQueue.main.async {
            self.moviesCollectionView.reloadData()
        }
    }
}

// UICollectionViewDelegateFlowLayout ile hücre boyutlarını ayarlayın
extension MoviesView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let centerX = collectionView.contentOffset.x + collectionView.bounds.width / 2
        let itemX = collectionView.layoutAttributesForItem(at: indexPath)?.center.x ?? 0

        // Hücre ortada mı değil mi kontrolü
        let maxDistance: CGFloat = 100
        let distance = abs(centerX - itemX)
        let scaleFactor: CGFloat = max(0.75, 1 - distance / maxDistance)
        let opacity: CGFloat = max(0.5, 1 - distance / maxDistance)
        collectionView.cellForItem(at: indexPath)?.alpha = opacity

        return CGSize(width: 250 * scaleFactor, height: 400)
    }

    // Scroll sonrası hücrelerin yeniden ölçeklendirilmesi
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard let collectionView = scrollView as? UICollectionView else { return }
        collectionView.visibleCells.forEach { cell in
            let indexPath = collectionView.indexPath(for: cell)
            let attributes = collectionView.layoutAttributesForItem(at: indexPath!)
            let centerX = collectionView.contentOffset.x + collectionView.bounds.width / 2
            let distance = abs(centerX - (attributes?.center.x ?? 0))
            let maxDistance: CGFloat = 200
            let scaleFactor: CGFloat = max(0.75, 1 - distance / maxDistance)
            let opacity: CGFloat = max(0.5, 1 - distance / maxDistance)
            cell.transform = CGAffineTransform(scaleX: scaleFactor, y: scaleFactor)
            cell.alpha = opacity
        }
    }
}
