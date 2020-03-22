//
//  Router.swift
//  Contacts
//
//  Created by Alexander Zaporozhchenko on 10/22/18.
//  Copyright © 2018 Aleksandr Zaporozhchenko. All rights reserved.
//


import ReactiveKit
import Bond


final class Router {
    
    static let shared = Router()
    typealias ID      = String
    
    var mainStoryboard: UIStoryboard!
    fileprivate var window: UIWindow!
    fileprivate var rootNavigation: UINavigationController!
    
    fileprivate enum Storyboards : String {
        case main = "Main"
    }
    
    //MARK: - Initialization
    
    init() {
        mainStoryboard              = UIStoryboard(name: Storyboards.main.rawValue, bundle: nil)
        rootNavigation              = mainStoryboard.instantiateInitialViewController() as? UINavigationController
        window                      = UIApplication.shared.delegate!.window!
        window!.rootViewController! = rootNavigation
        window!.makeKeyAndVisible()
    }
    
    //MARK: - Global
    
    func showAlert(message: String? = nil) {
        let alert = UIAlertController(title: "Something went wrong",
                                      message: message ?? "try again",
                                      preferredStyle: .alert)
        
        let secondAction = UIAlertAction(title: "Okay",
                                         style: .default,
                                         handler: nil)
        alert.addAction(secondAction)
        self.rootNavigation.viewControllers.first!.present(alert, animated: true, completion: nil)
    }
    
    func pop() {
        rootNavigation.popViewController(animated: true)
    }
    
    func present(vc: UIViewController) {
        if let topController = UIApplication.topViewController() {
            topController.present(vc, animated: true, completion: nil)
        }
    }
    
    func poptoRoot() {
        rootNavigation.popToRootViewController(animated: true)
    }
    
    func poptoVC(vcClass:AnyClass) {
        
        let controllers = rootNavigation.viewControllers
        let maybeOurs   = controllers.filter { $0.isKind(of: vcClass)}.first
        
        if let vc = maybeOurs {
            rootNavigation.popToViewController(vc, animated: true)
        }
    }
    
    func push(_ controller: UIViewController) {
        rootNavigation.navigationBar.isHidden = false
        rootNavigation.pushViewController(controller, animated: true)
    }
    
    func dissmissTop()  {
        if let topController = UIApplication.topViewController() {
            topController.dismiss(animated: true, completion: nil)
        }
    }
    
    
    //MARK: - Global Signals
    
    func dissmissTopSignal() -> SafeSignal<Void>  {
        
        return SafeSignal<Void> { observer in
            
            if let topController = UIApplication.topViewController() {
                topController.dismiss(animated: true, completion: nil)
            }
            
            observer.next(())
            observer.completed()
            return SimpleDisposable()
        }
    }
    
    func popSignal() -> SafeSignal<Void> {
        return SafeSignal<Void> { observer in
            self.pop()
            observer.next(())
            observer.completed()
            return SimpleDisposable()
        }
    }
}

