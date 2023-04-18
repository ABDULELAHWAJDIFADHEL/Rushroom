package com.rush_rooms.ui.Successfully

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivitySuccessfullyBinding
import com.rush_rooms.ui.Login.LoginActivity
import com.rush_rooms.ui.Welcome.WelcomeActivity

class SuccessfullyActivity : AppCompatActivity() {
    lateinit var binding: ActivitySuccessfullyBinding

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySuccessfullyBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.login_again)

    }

    private fun lstnr() {
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this,LoginActivity::class.java).setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP))
            finish()
        }

    }
}