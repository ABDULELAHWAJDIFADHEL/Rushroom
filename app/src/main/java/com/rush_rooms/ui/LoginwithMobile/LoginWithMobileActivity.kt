package com.rush_rooms.ui.LoginwithMobile

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityLoginWithMobileBinding
import com.rush_rooms.ui.ConfrimYourMobile.ConfirmYourMobileActivity

class LoginWithMobileActivity : AppCompatActivity() {
    lateinit var binding: ActivityLoginWithMobileBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginWithMobileBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.send_otp)
    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            onBackPressed()
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, ConfirmYourMobileActivity::class.java))

        }

    }
}