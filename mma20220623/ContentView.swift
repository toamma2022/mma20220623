//
//  ContentView.swift
//  mma20220623
//
//  Created by YASUSHI NOZAKI on R 4/06/23.
//

import SwiftUI
import CoreMotion


struct ContentView: View {
    @State private var angle = 0.5
    
    // MotionManager
    let motionManager = CMMotionManager()
    
    
    
    var body: some View {
        VStack {
            Image("leftarrow").rotationEffect(.degrees(Double(self.angle)))
                .padding()
        }
        .onAppear() {
            if self.motionManager.isAccelerometerAvailable {
                // intervalの設定 [sec]
                self.motionManager.accelerometerUpdateInterval = 0.05

                // センサー値の取得開始
                self.motionManager.startAccelerometerUpdates(
                    to: OperationQueue.current!,
                    withHandler: {(accelData: CMAccelerometerData?, errorOC: Error?) in
                        if let accelData = accelData {
                            self.outputAccelData(acceleration: accelData.acceleration)
                        }
                    })
        }
            
        }

    }

    func outputAccelData(acceleration: CMAcceleration){
        // 加速度センサー [G]
        print(String(format: "x:%06f, y:%06f, z:%06f", acceleration.x, acceleration.y, acceleration.z))
        self.angle = -90 * acceleration.x + 90
    }
}
    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
