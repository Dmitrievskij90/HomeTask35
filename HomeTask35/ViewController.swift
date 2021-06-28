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


        // MARK: - BehaviorSubject
        // MARK: -
        print("-----------------------------------")
        print("BehaviorSubject:")
        let behaviorSubject = BehaviorSubject(value: 1)

        // first event
        behaviorSubject.onNext(10)

        // first subscription
        behaviorSubject.subscribe {
            print("first subscription:", self.testValue + $0)
        }
        .disposed(by: disposeBag)

        // second event
        behaviorSubject.onNext(20)

        // second subscription
        behaviorSubject.subscribe {
            print("second subscription:", self.testValue + $0)
        }.disposed(by: disposeBag)

        // third event
        behaviorSubject.onNext(30)

        // MARK: - ReplaySubject
        // MARK: -
        print("-----------------------------------")
        print("ReplaySubject:")
        let replaySubject = ReplaySubject<Int>.create(bufferSize: 2)

        // first event
        replaySubject.onNext(10)

        // first subscription
        replaySubject.subscribe {
            print("first subscription:", self.testValue + $0)
        }
        .disposed(by: disposeBag)

        // second event
        replaySubject.onNext(20)

        // second subscription
        replaySubject.subscribe {
            print("second subscription:", self.testValue + $0)
        }
        .disposed(by: disposeBag)

        // third event
        replaySubject.onNext(30)
    }
}

