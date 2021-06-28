//
//  ViewController.swift
//  HomeTask35
//
//  Created by Konstantin Dmitrievskiy on 28.06.2021.
//

import UIKit
import RxSwift

class ViewController: UIViewController {

    private var testValue = 0
    private let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        //MARK: - PublishSubject
        //MARK: -
        print("PublishSubject:")
        let publishSubject = PublishSubject<Int>()

        //first event
        publishSubject.onNext(10)

        //first subscription
        publishSubject.subscribe {
            print("first subscription:", self.testValue + $0)
        }
        .disposed(by: disposeBag)

        //second event
        publishSubject.onNext(20)

        //second subscription
        publishSubject.subscribe {
            print("second subscription:", self.testValue + $0)
        }
        .disposed(by: disposeBag)

        //third event
        publishSubject.onNext(30)


}

