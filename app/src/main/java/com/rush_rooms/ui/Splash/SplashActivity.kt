package com.rush_rooms.ui.Splash

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.os.Handler
import android.view.WindowManager
import com.rush_rooms.R
import com.rush_rooms.Utils.CommonUtil
import com.rush_rooms.ui.LanguageChange.LanguageChangeActivity
import com.rush_rooms.ui.walkThrough.TourActivity

class SplashActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_splash)
        callScreen()
        window.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        )
    }

    fun callScreen() {
        Handler().postDelayed({
            startActivity(Intent(this, TourActivity::class.java))
        }, 2000)
    }
}