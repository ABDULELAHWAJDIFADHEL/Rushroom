package com.rush_rooms.ui.LanguageChange

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityLanguageChangeBinding
import com.rush_rooms.ui.Splash.SplashActivity
import com.rush_rooms.ui.walkThrough.TourActivity

class LanguageChangeActivity : AppCompatActivity() {
    lateinit var binding: ActivityLanguageChangeBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLanguageChangeBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
        binding.confromBtn.tvCommonTitle.text = getString(R.string.confirm)
    }

    private fun initView() {


    }

    private fun lstnr() {
        binding.layEnglish.setOnClickListener {
            selectEnglishBackground()
            binding.confromBtn.tvCommonTitle.text = getString(R.string.confirm)
            binding.btmLay.visibility = View.VISIBLE
            binding.textView14.text ="Select your language"
        }
        binding.layAb.setOnClickListener {
            selectArbicBackground()
            binding.confromBtn.tvCommonTitle.text = getString(R.string.ab)
            binding.btmLay.visibility = View.VISIBLE
            binding.textView14.text ="اختر لغتك"

        }
        binding.confromBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this,SplashActivity::class.java))
            finish()
        }
    }

    fun selectEnglishBackground() {
        binding.layEnglish.setBackgroundResource(R.drawable.lang_common_stroke_bg)
        binding.layAb.setBackgroundResource(R.drawable.common_white_bg)
    }

    fun selectArbicBackground() {
        binding.layEnglish.setBackgroundResource(R.drawable.common_white_bg)
        binding.layAb.setBackgroundResource(R.drawable.lang_common_stroke_bg)
    }
}