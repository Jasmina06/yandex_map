// MainApplication.java
package com.example.map_yandex1

import android.app.Application
import com.yandex.mapkit.MapKitFactory

class MainApplication : Application() {
    @Override
    fun onCreate() {
        super.onCreate()
        
        // Инициализация Yandex MapKit с вашим API ключом
        MapKitFactory.setApiKey("0c25ab95-5dd3-4d59-981a-d74d66a8158c")
    }
}