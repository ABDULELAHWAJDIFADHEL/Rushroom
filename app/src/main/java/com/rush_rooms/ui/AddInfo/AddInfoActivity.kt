package com.rush_rooms.ui.AddInfo

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.google.android.material.datepicker.MaterialDatePicker
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityAddInfoBinding
import com.rush_rooms.ui.Login.LoginActivity
import java.text.SimpleDateFormat
import java.util.*

class AddInfoActivity : AppCompatActivity() {
    lateinit var binding: ActivityAddInfoBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAddInfoBinding.inflate(layoutInflater)
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
            startActivity(
                Intent(
                    this,
                    LoginActivity::class.java
                ).setFlags(Intent.FLAG_ACTIVITY_CLEAR_TOP)
            )
            finish()
        }
        binding.editDateofBirth.setOnClickListener {
            MaterialDatePicker.Builder.datePicker().setSelection(Date().time).build()
                .apply {
                    show(supportFragmentManager, this@AddInfoActivity.toString())
                    addOnPositiveButtonClickListener {
                        binding.editDateofBirth.setText(
                            SimpleDateFormat("dd/MM/yyyy", Locale.getDefault()).format(
                                Date(it)
                            )
                        )
                    }
                }
        }
    }
}