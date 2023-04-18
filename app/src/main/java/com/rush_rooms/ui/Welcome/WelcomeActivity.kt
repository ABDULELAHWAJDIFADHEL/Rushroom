package com.rush_rooms.ui.Welcome

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ArrayAdapter
import android.widget.Spinner
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityWelcomeBinding
import com.rush_rooms.ui.Login.LoginActivity
import com.rush_rooms.ui.AddInfo.AddInfoActivity
import com.rush_rooms.ui.Signup.SignupActivity

class WelcomeActivity : AppCompatActivity() {
    lateinit var binding: ActivityWelcomeBinding
    private lateinit var spiner: Spinner
    private lateinit var adptrlist: ArrayAdapter<String>

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityWelcomeBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()

    }

    private fun initView() {
        spiner = binding.lang
        var list = resources.getStringArray(R.array.Lang)
        adptrlist = ArrayAdapter(this,R.layout.spinner_dropdown_item,list)
        adptrlist.setDropDownViewResource(android.R.layout.simple_spinner_dropdown_item)
        spiner.adapter = adptrlist
    }

    private fun lstnr() {
        binding.tvlogin.setOnClickListener {
            startActivity(Intent(this, LoginActivity::class.java))
        }
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, SignupActivity::class.java))
        }

    }
}