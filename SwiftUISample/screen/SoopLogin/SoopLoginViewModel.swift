//
//  SoopLoginViewModel.swift
//  SwiftUISample
//
//  Created by haram on 4/16/25.
//

import Foundation
import SwiftUI
import Combine
enum Field: Hashable {
    case id
    case password
}
final class SoopLoginViewModel:ObservableObject{
    
    private var cancellables = Set<AnyCancellable>()
    
    @Published var focusedField: Field? = nil
    @Published var isLogin = false
    @Published var isPassword = false
    @Published var idField: String = ""  // 입력된 텍스트를 저장할 상태 변수
    @Published var passwordField:String = ""
    @Published var isActivateLogin = false
    
    func onAppear(){
        Publishers.CombineLatest($idField, $passwordField).sink{
            print("id: \($0), password: \($1)")
            self.isActivateLogin =  ($0.count > 5 && $1.count > 5) ? true:false
        }.store(in: &cancellables)
    }
    
    func didTouchIDField(){
        focusedField = .id
        isLogin = true
        isPassword = false
    }
    
    func didTouchPasswordField(){
        focusedField = .password
        isPassword = true
        isLogin = false
    }
    
    func didTouchMainView(){
        isLogin = false
        isPassword = false
        focusedField = nil
    }
}
