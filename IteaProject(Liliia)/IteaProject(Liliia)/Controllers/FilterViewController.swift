//
//  FilterViewController.swift
//  IteaProject(Liliia)
//
//  Created by Лилия on 5/8/19.
//  Copyright © 2019 ITEA. All rights reserved.
//

import UIKit

class FilterViewController: UIViewController {
    @IBOutlet weak var imageChoiceDailyTime: UIImageView!
    @IBOutlet weak var dailyView: UIView!
    @IBOutlet weak var imageChoiceEveningTime: UIImageView!
    @IBOutlet weak var eveningView: UIView!
    
    @IBOutlet weak var imageChoiceProgrammingType: UIImageView!
    @IBOutlet weak var programmingView: UIView!
    @IBOutlet weak var imageChoiceFrontendType: UIImageView!
    @IBOutlet weak var frontendView: UIView!
    @IBOutlet weak var imageChoiceDesignType: UIImageView!
    @IBOutlet weak var designView: UIView!
    @IBOutlet weak var imageChoiceQaType: UIImageView!
    @IBOutlet weak var qaView: UIView!
    @IBOutlet weak var imageChoiceMobileDevelopmentType: UIImageView!
    @IBOutlet weak var imageChoiceOtherType: UIImageView!
    @IBOutlet weak var mobileView: UIView!
    @IBOutlet weak var otherView: UIView!
    
    var arrayCoursesFilter : [Courses] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewEdit(view: dailyView)
        viewEdit(view: eveningView)
        viewEdit(view: programmingView)
        viewEdit(view: frontendView)
        viewEdit(view: designView)
        viewEdit(view: qaView)
        viewEdit(view: mobileView)
        viewEdit(view: otherView)
    }
    
    func buttonEdit(button: UIButton) {
        button.clipsToBounds = true
        button.layer.cornerRadius = 10
    }
    
    func viewEdit(view: UIView) {
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    @IBAction func DidTapBackViewController(_ sender: Any) {
        if (imageChoiceDailyTime.isHidden == true &&  imageChoiceEveningTime.isHidden == true && imageChoiceProgrammingType.isHidden == true && imageChoiceFrontendType.isHidden == true && imageChoiceDesignType.isHidden == true && imageChoiceQaType.isHidden == true && imageChoiceMobileDevelopmentType.isHidden == true && imageChoiceOtherType.isHidden == true) {
            if let vc = self.navigationController?.viewControllers[1] as? CourseViewController {
                vc.arrayCourses = arrayCoursesFilter
                vc.collectionView?.reloadData()
                navigationController?.popToViewController(vc, animated: true)
            }
        }
        
        choiceCourse(image1: imageChoiceDailyTime, image2: imageChoiceProgrammingType, filter1: "daily", filter2: "programming")
        choiceCourse(image1: imageChoiceDailyTime, image2: imageChoiceFrontendType, filter1: "daily", filter2: "frontend")
        choiceCourse(image1: imageChoiceDailyTime, image2: imageChoiceDesignType, filter1: "daily", filter2: "design")
        choiceCourse(image1: imageChoiceDailyTime, image2: imageChoiceQaType, filter1: "daily", filter2: "qa")
        choiceCourse(image1: imageChoiceDailyTime, image2: imageChoiceMobileDevelopmentType, filter1: "daily", filter2: "mobile")
        choiceCourse(image1: imageChoiceDailyTime, image2: imageChoiceOtherType, filter1: "daily", filter2: "other")
        
        choiceCourse(image1: imageChoiceEveningTime, image2: imageChoiceProgrammingType, filter1: "evening", filter2: "programming")
        choiceCourse(image1: imageChoiceEveningTime, image2: imageChoiceFrontendType, filter1: "evening", filter2: "frontend")
        choiceCourse(image1: imageChoiceEveningTime, image2: imageChoiceDesignType, filter1: "evening", filter2: "design")
        choiceCourse(image1: imageChoiceEveningTime, image2: imageChoiceQaType, filter1: "evening", filter2: "qa")
        choiceCourse(image1: imageChoiceEveningTime, image2: imageChoiceMobileDevelopmentType, filter1: "evening", filter2: "mobile")
        choiceCourse(image1: imageChoiceEveningTime, image2: imageChoiceOtherType, filter1: "evening", filter2: "other")
        
        choiceCourseByTime()
    }
    
    @IBAction func didTapHideInsideImageDailyTime(_ sender: Any) {
        if imageChoiceDailyTime.isHidden == false {
            imageChoiceDailyTime.isHidden = true
            imageChoiceEveningTime.isHidden = false
        } else {
            imageChoiceDailyTime.isHidden = false
            imageChoiceEveningTime.isHidden = true
        }
    }
    
    @IBAction func didTapHideInsideImageEveningTime(_ sender: Any) {
        if imageChoiceEveningTime.isHidden == false {
            imageChoiceEveningTime.isHidden = true
            imageChoiceDailyTime.isHidden = false
        } else {
            imageChoiceEveningTime.isHidden = false
            imageChoiceDailyTime.isHidden = true
        }
    }
    
    @IBAction func didTapHideInsideImageProgrammingType(_ sender: Any) {
        hideOrUnhide(hideImage: imageChoiceProgrammingType!, unhideImage1: imageChoiceFrontendType!, unhideImage2: imageChoiceDesignType!, unhideImage3: imageChoiceQaType!, unhideImage4: imageChoiceMobileDevelopmentType!, unhideImage5: imageChoiceOtherType!)
    }
    
    @IBAction func didTapHideInsideImageFrontendType(_ sender: Any) {
        hideOrUnhide(hideImage: imageChoiceFrontendType!, unhideImage1: imageChoiceProgrammingType!, unhideImage2: imageChoiceDesignType!, unhideImage3: imageChoiceQaType!, unhideImage4: imageChoiceMobileDevelopmentType!, unhideImage5: imageChoiceOtherType!)
    }
    
    @IBAction func didTapHideInsideImageDesignType(_ sender: Any) {
        hideOrUnhide(hideImage: imageChoiceDesignType!, unhideImage1: imageChoiceFrontendType!, unhideImage2: imageChoiceProgrammingType!, unhideImage3: imageChoiceQaType!, unhideImage4: imageChoiceMobileDevelopmentType!, unhideImage5: imageChoiceOtherType!)
    }
    
    @IBAction func didTapHideInsideImageQaType(_ sender: Any) {
        hideOrUnhide(hideImage: imageChoiceQaType!, unhideImage1: imageChoiceFrontendType!, unhideImage2: imageChoiceProgrammingType!, unhideImage3: imageChoiceDesignType!, unhideImage4: imageChoiceMobileDevelopmentType!, unhideImage5: imageChoiceOtherType!)
    }
    
    @IBAction func didTapHideInsideImageMobiliDevelopmentType(_ sender: Any) {
        hideOrUnhide(hideImage: imageChoiceMobileDevelopmentType!, unhideImage1: imageChoiceFrontendType!, unhideImage2: imageChoiceProgrammingType!, unhideImage3: imageChoiceDesignType!, unhideImage4: imageChoiceQaType!, unhideImage5: imageChoiceOtherType!)
    }
    
    @IBAction func didTapHideInsideImageOtherType(_ sender: Any) {
        hideOrUnhide(hideImage: imageChoiceOtherType!, unhideImage1: imageChoiceFrontendType!, unhideImage2: imageChoiceProgrammingType!, unhideImage3: imageChoiceDesignType!, unhideImage4: imageChoiceQaType!, unhideImage5: imageChoiceMobileDevelopmentType!)
    }
    
    func hideOrUnhide(hideImage: UIImageView, unhideImage1: UIImageView, unhideImage2: UIImageView, unhideImage3: UIImageView, unhideImage4: UIImageView, unhideImage5: UIImageView)  {
        if hideImage.isHidden == false {
            hideImage.isHidden = true
            unhideImage1.isHidden = false
            unhideImage2.isHidden = false
            unhideImage3.isHidden = false
            unhideImage4.isHidden = false
            unhideImage5.isHidden = false
        } else {
            hideImage.isHidden = false
            unhideImage1.isHidden = true
            unhideImage2.isHidden = true
            unhideImage3.isHidden = true
            unhideImage4.isHidden = true
            unhideImage5.isHidden = true
        }
    }
    
    func choiceCourse(image1: UIImageView, image2: UIImageView, filter1: String, filter2: String) {
        if let vc = self.navigationController?.viewControllers[1] as? CourseViewController {
            if image1.isHidden == false && image2.isHidden == false {
                let arrayTimeFilter = arrayCoursesFilter.filter {$0.trainingCourses == filter1}
                let arrayTypeFilter = arrayTimeFilter.filter {$0.typeTrainingCourses == filter2}
                if arrayTypeFilter.count == 0 {
                    Alert(info: "По заданым критериям ничего не найдено")
                } else {
                    vc.arrayCourses = arrayTypeFilter
                    vc.collectionView?.reloadData()
                    navigationController?.popToViewController(vc, animated: true)
                    }
                }
            }
        }
    
    func choiceCourseByTime() {
        if let vc = self.navigationController?.viewControllers[1] as? CourseViewController {
                if (imageChoiceDailyTime.isHidden == false && imageChoiceProgrammingType.isHidden == true && imageChoiceFrontendType.isHidden == true && imageChoiceDesignType.isHidden == true && imageChoiceQaType.isHidden == true && imageChoiceMobileDevelopmentType.isHidden == true && imageChoiceOtherType.isHidden == true) {
                        let arrayDailyFilter = arrayCoursesFilter.filter {$0.trainingCourses == "daily"}
                        vc.arrayCourses = arrayDailyFilter
                        vc.collectionView?.reloadData()
                         navigationController?.popToViewController(vc, animated: true)
                    } else if (imageChoiceEveningTime.isHidden == false && imageChoiceProgrammingType.isHidden == true && imageChoiceFrontendType.isHidden == true && imageChoiceDesignType.isHidden == true && imageChoiceQaType.isHidden == true && imageChoiceMobileDevelopmentType.isHidden == true && imageChoiceOtherType.isHidden == true)  {
                        let arrayEveningFilter = arrayCoursesFilter.filter {$0.trainingCourses != "daily"}
                        vc.arrayCourses = arrayEveningFilter
                        vc.collectionView?.reloadData()
                    navigationController?.popToViewController(vc, animated: true)
            }
        }
    }
    
    func Alert(info: String) {
        let alert = UIAlertController(title: "Ошибка", message: info, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Повторить еще раз", style: .default, handler: nil))
        self.present(alert,animated: true)
    }
}
