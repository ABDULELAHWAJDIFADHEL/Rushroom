package com.rush_rooms.ui.Forgot

import android.content.Intent
import android.graphics.Color
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.core.content.ContextCompat
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityForgotBinding
import com.rush_rooms.ui.ResetPassword.ResetPasswordActivity

class ForgotActivity : AppCompatActivity() {
    lateinit var binding: ActivityForgotBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityForgotBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.reset_password_new)

    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            finish()
        }
        binding.radioEmail.setOnClickListener {
            emailChange()
            binding.filledTextField.visibility = View.VISIBLE
            binding.mainLay.visibility = View.INVISIBLE
        }
        binding.radioMobile.setOnClickListener {
            mobileChange()
            binding.filledTextField.visibility = View.INVISIBLE
            binding.mainLay.visibility = View.VISIBLE
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this,ResetPasswordActivity::class.java))
        }


    }
    private fun emailChange(){
        binding.radioEmail.setTextColor(Color.parseColor("#FF000000"))
        binding.radioMobile.setTextColor(Color.parseColor("#A8A8A8"))
        binding.radioEmail.isChecked = true
        binding.radioMobile.isChecked = false
//        binding.radioMobile.setBackgroundTintList(ContextCompat.getColorStateList(getApplicationContext(), R.color.dark_gray))
//        binding.radioEmail.setBackgroundTintList(ContextCompat.getColorStateList(getApplicationContext(), R.color.black))
    }
    private fun mobileChange(){
        binding.radioEmail.setTextColor(Color.parseColor("#A8A8A8"))
        binding.radioMobile.setTextColor(Color.parseColor("#FF000000"))
        binding.radioMobile.isChecked = true
        binding.radioEmail.isChecked = false
//        binding.radioMobile.setBackgroundTintList(ContextCompat.getColorStateList(getApplicationContext(), R.color.black));
//        binding.radioEmail.setBackgroundTintList(ContextCompat.getColorStateList(getApplicationContext(), R.color.dark_gray));
    }
}