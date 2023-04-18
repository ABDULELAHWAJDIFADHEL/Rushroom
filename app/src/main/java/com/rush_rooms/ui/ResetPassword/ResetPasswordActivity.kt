package com.rush_rooms.ui.ResetPassword

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityResetPasswordBinding
import com.rush_rooms.ui.Successfully.SuccessfullyActivity

class ResetPasswordActivity : AppCompatActivity() {
    lateinit var binding: ActivityResetPasswordBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityResetPasswordBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.reset)

    }

    private fun lstnr() {
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this,SuccessfullyActivity::class.java))

        }
        binding.ivBack.setOnClickListener {
            finish()
        }

    }
}