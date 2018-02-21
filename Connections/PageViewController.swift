//
//  PageViewController.swift
//  Connections
//
//  Created by Xinyi Zhuang on 20/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
  let questionsVCs = [
    Storyboard.Question.get(QuestionViewController.self),
    Storyboard.Question.get(QuestionViewController.self),
    Storyboard.Question.get(QuestionViewController.self),
    Storyboard.Question.get(QuestionViewController.self),
    Storyboard.Question.get(QuestionViewController.self),
    Storyboard.Question.get(QuestionViewController.self)
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    dataSource = self
    setViewControllers([questionsVCs[0]], direction: .forward, animated: false, completion: nil)
  }
}

extension PageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let currentQuestionVc = viewController as? QuestionViewController,
      let index = questionsVCs.index(of: currentQuestionVc),
      index > 0 else { return nil }
    return questionsVCs[index-1]
  }

  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let currentQuestionVc = viewController as? QuestionViewController,
      let index = questionsVCs.index(of: currentQuestionVc),
      index < questionsVCs.count - 1 else { return nil }
    return questionsVCs[index+1]
  }
}
