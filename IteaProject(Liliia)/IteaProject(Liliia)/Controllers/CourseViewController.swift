//
//  CourseViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/8/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class CourseViewController: UIViewController {
    @IBOutlet weak var ProfileButtonOutlet: UIButton!
    @IBOutlet weak var FilterButtonOutlet: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var arrayCourses = CoursesManager().CourseArray
    var arrayCourses1 = CoursesManager().CourseArray
    //var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.isNavigationBarHidden = true
        //searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.collectionView.frame.size.width - 20)/3, height: (self.collectionView.frame.size.height)/5)
  
        buttonEdit(button: ProfileButtonOutlet)
        buttonEdit(button: FilterButtonOutlet)
        
        collectionView.backgroundColor = UIColor.clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
    }
    
    func buttonEdit(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    @IBAction func DidTapPersonalPage(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "ProfileViewController") as! ProfileViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func DidTapFilter(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "FilterViewController") as! FilterViewController
        vc.arrayCoursesFilter = arrayCourses1
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

extension CourseViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrayCourses.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        item.update(course: arrayCourses[indexPath.row])
        item.fotoCourcesImage.layer.shadowOffset = CGSize(width: 5, height: 5)
        item.fotoCourcesImage.layer.shadowOpacity = 0.7
        item.fotoCourcesImage.layer.shadowRadius = 1
        item.fotoCourcesImage.layer.shadowColor = UIColor(red: 44.0/255.0, green: 62.0/255.0, blue: 80.0/255.0, alpha: 1.0).cgColor
        return item
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "TypeCoursesViewController") as! TypeCoursesViewController
        vc.nameCourse = arrayCourses[indexPath.row].nameCourses
        vc.nameTypes = arrayCourses[indexPath.row].nameTypeCourses
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

//extension CourseViewController: UISearchBarDelegate {
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//
//    }
//}
