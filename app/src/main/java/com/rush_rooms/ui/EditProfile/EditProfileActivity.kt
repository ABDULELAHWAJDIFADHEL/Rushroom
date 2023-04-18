package com.rush_rooms.ui.EditProfile

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityEditProfileBinding

class EditProfileActivity : AppCompatActivity() {
    lateinit var bin: ActivityEditProfileBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        bin = ActivityEditProfileBinding.inflate(layoutInflater)
        setContentView(bin.root)
        initView()
        lstnr()
    }

    private fun initView() {
        bin.editToolbar.tvTittle.text = getString(R.string.edit_profile)
        bin.verify.tvCommonTitle.text = getString(R.string.verify_now)
        bin.confromBtn.tvCommonTitle.text = getString(R.string.update)

    }

    private fun lstnr() {
        bin.editToolbar.ivBack.setOnClickListener {
            finish()
        }
        bin.ExpiryDate.setOnClickListener {
            bin.verify.tvCommonTitle.visibility = View.VISIBLE
        }

    }
}