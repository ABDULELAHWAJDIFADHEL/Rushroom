package com.rush_rooms.ui.Login

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Spinner
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityLoginBinding
import com.rush_rooms.ui.Forgot.ForgotActivity
import com.rush_rooms.ui.LoginwithMobile.LoginWithMobileActivity
import com.rush_rooms.ui.LoginwithUserName.LoginWithUserNameActivity
import com.rush_rooms.ui.Main.MainActivity

class LoginActivity : AppCompatActivity() {
    lateinit var binding: ActivityLoginBinding
    private lateinit var spiner: Spinner
    private lateinit var adptrlist: ArrayAdapter<String>
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityLoginBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        allSpinerSetUp()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.login)
        binding.loginwithMobile.tvCommonTitle.text = getString(R.string.login_with_mobile_number)
        binding.loginwithUserName.tvCommonTitle.text = getString(R.string.login_with_username)
    }

    private fun allSpinerSetUp() {
        spiner = binding.lang
        var list = resources.getStringArray(R.array.Lang)
        adptrlist = ArrayAdapter(this, R.layout.spinner_dropdown_item, list)
        adptrlist.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spiner.adapter = adptrlist
    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            finish()
        }
        binding.loginwithMobile.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, LoginWithMobileActivity::class.java))
        }
        binding.tvforgot.setOnClickListener {
            startActivity(Intent(this, ForgotActivity::class.java))
        }
        binding.loginwithUserName.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, LoginWithUserNameActivity::class.java))
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, MainActivity::class.java))
        }
    }


}