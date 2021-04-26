//
//  ClientB.swift
//  WhiteLabelSwiftUITest
//
//  Created by Lehnherr Reto on 22.04.21.
//
#if ClientB
import UIKit

struct Client: Whitelabelable {
    var name: String { return "Client B" }
    var tintColor: UIColor { return .red }
}
#endif
