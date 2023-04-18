package com.rush_rooms.ui.ChangePassword

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityChangePasswordBinding

class ChangePasswordActivity : AppCompatActivity() {
    lateinit var bin: ActivityChangePasswordBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        bin = ActivityChangePasswordBinding.inflate(layoutInflater)
        setContentView(bin.root)
        initView()
        lstnr()
    }

    private fun initView() {
        bin.chnageToolbar.tvTittle.text = getString(R.string.change_password)
        bin.tvchangePassword.tvCommonTitle.text =  getString(R.string.change_password)

    }

    private fun lstnr() {
        bin.chnageToolbar.ivBack.setOnClickListener {
            finish()
        }

    }
}