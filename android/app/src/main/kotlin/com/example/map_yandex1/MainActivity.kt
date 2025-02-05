package com.example.map_yandex1

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication : Application() {
    override fun onCreate() {
        super.onCreate()


        MapKitFactory.setApiKey("0c25ab95-5dd3-4d59-981a-d74d66a8158c")
    }
}
