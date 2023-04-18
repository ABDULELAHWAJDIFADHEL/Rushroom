package com.rush_rooms.ui.LoginwithUserName

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityLoginWithUserNameBinding
import com.rush_rooms.ui.ConfirmYourEmail.ConfirmYourEmailActivity
import com.rush_rooms.ui.Login.LoginActivity

class LoginWithUserNameActivity : AppCompatActivity() {
    lateinit var binding: ActivityLoginWithUserNameBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginWithUserNameBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.login)

    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            onBackPressed()
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this,LoginActivity::class.java).setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP))
            finish()
        }
        binding.tvforgot.setOnClickListener {
            startActivity(Intent(this, ConfirmYourEmailActivity::class.java))
        }

    }
}