//
//  ClientA.swift
//  WhiteLabelSwiftUITest
//
//  Created by Lehnherr Reto on 22.04.21.
//
#if ClientA
import UIKit

struct Client: Whitelabelable {
    var name: String { return "Client A" }
    var tintColor: UIColor { return .blue }
}
#endif
