package com.rush_rooms.ui.PaymentConfirm

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityPaymentConfirmBinding
import com.rush_rooms.ui.Main.MainActivity

class PaymentConfirmActivity : AppCompatActivity() {
    lateinit var binding: ActivityPaymentConfirmBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPaymentConfirmBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.commonBtn.tvCommonTitle.text = getString(R.string.back_to_home)

    }

    private fun lstnr() {
        binding.commonBtn.tvCommonTitle.setOnClickListener {
            startActivity(
                Intent(
                    this,
                    MainActivity::class.java
                ).setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            )
            finish()
        }

    }
}