//
//  ContentView.swift
//  LVN Pre-Flight Check
//

import SwiftUI
import LiveViewNative
import LiveViewNativeLiveForm
import LiveViewNativeCharts
import LiveViewNativeMapKit
import LiveViewNativeAVKit

struct ContentView: View {
    var body: some View {
        #LiveView(
            .automatic(
                development: URL(string: "https://lvn-demo.fly.dev/")!,
                production: URL(string: "https://lvn-demo.fly.dev/")!
            ),
            addons: [
                LiveFormRegistry<_>.self,
                AVKitRegistry<_>.self,
                MapKitRegistry<_>.self,
                ChartsRegistry<_>.self
            ]
        ) {
            ConnectingView()
        } disconnected: {
            DisconnectedView()
        } reconnecting: { content, isReconnecting in
            ReconnectingView(isReconnecting: isReconnecting) {
                content
            }
        } error: { error in
            ErrorView(error: error)
        }
    }
}
