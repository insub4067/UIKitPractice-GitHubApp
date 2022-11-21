//
//  ErrorMessage.swift
//  UIKitPractice-GitHubApp
//
//  Created by Kim Insub on 2022/11/21.
//

import Foundation

enum ErrorMessage: String {
    case invalidUsername = "This username created an invalid request. Pleaes try again."
    case unableToComplete = "Unable to complete your request. Please check your internet connection."
    case invalidResponse = "Invalid reponse from server. Please try again."
    case invalidData = "The data recieved from the server was invalid. Please try again."

}
