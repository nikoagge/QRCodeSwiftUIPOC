//
//  ContentView.swift
//  QRCodeSwiftUIPOC
//
//  Created by Nikos Aggelidis on 20/1/24.
//

import SwiftUI
import CodeScanner

struct ContentView: View {
    @State var isPresentingScanner = false
    @State var scannedCode: String = "Scan a QR code to get started."
    
    var scannerShet: some View {
        CodeScannerView(codeTypes: [.qr]) { result in
            if case let .success(code) = result {
                self.scannedCode = code.string
                self.isPresentingScanner = false
            }
        }
    }
    
    var body: some View {
        VStack(spacing: 13) {
            Text(scannedCode)
            
            Button("Scan QR code") {
                self.isPresentingScanner = true
            }
            .sheet(isPresented: $isPresentingScanner) {
                self.scannerShet
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
