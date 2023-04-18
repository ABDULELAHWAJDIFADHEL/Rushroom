package com.rush_rooms.ui.Signup

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivitySignupBinding
import com.rush_rooms.ui.AddInfo.AddInfoActivity

class SignupActivity : AppCompatActivity() {
    lateinit var binding: ActivitySignupBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySignupBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.continues)

    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            finish()
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, AddInfoActivity::class.java))
            finish()
        }

    }
}