//
//  PageViewController.swift
//  Connections
//
//  Created by Xinyi Zhuang on 20/02/2018.
//  Copyright © 2018 FBApps. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController {
  var selectionVcs = [SelectionViewController]()

  override func viewDidLoad() {
    super.viewDidLoad()
    for _ in 1...50 {
      let vc = Storyboard.Question.get(SelectionViewController.self)
      selectionVcs += [vc]
    }
    dataSource = self
    delegate = self
    setViewControllers([selectionVcs[0]], direction: .forward, animated: false, completion: nil)
  }
}

extension PageViewController: UIPageViewControllerDelegate {
  func pageViewController(_ pageViewController: UIPageViewController,
                          didFinishAnimating finished: Bool,
                          previousViewControllers: [UIViewController],
                          transitionCompleted completed: Bool) {
    guard let questionVc = parent as? QuestionViewController else {
      fatalError("please call add child in QuestionViewController")
    }
    // grab the question in this page and change the question text to be the label
    questionVc.questionLabel.text = "haha" + arc4random().description
    print(questionVc)
  }
}

extension PageViewController: UIPageViewControllerDataSource {
  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerBefore viewController: UIViewController) -> UIViewController? {
    guard let selectViewController = viewController as? SelectionViewController,
      let index = selectionVcs.index(of: selectViewController),
      index > 0 else { return nil }
    return selectionVcs[index-1]
  }

  func pageViewController(_ pageViewController: UIPageViewController,
                          viewControllerAfter viewController: UIViewController) -> UIViewController? {
    guard let selectViewController = viewController as? SelectionViewController,
      let index = selectionVcs.index(of: selectViewController),
      index < selectionVcs.count - 1 else { return nil }
    return selectionVcs[index+1]
  }
}
