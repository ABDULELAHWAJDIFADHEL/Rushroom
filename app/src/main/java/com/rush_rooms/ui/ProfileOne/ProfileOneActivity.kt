package com.rush_rooms.ui.ProfileOne

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityProfileOneBinding
import com.rush_rooms.ui.EditProfile.EditProfileActivity

class ProfileOneActivity : AppCompatActivity() {
    lateinit var bin: ActivityProfileOneBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        bin = ActivityProfileOneBinding.inflate(layoutInflater)
        setContentView(bin.root)
        initView()
        lstnr()
    }

    private fun initView() {
        bin.profileOneToolbar.tvEdit.visibility = View.VISIBLE
        bin.profileOneToolbar.tvTittle.text = getString(R.string.profile)

    }

    private fun lstnr() {
        bin.profileOneToolbar.tvEdit.setOnClickListener {
            startActivity(Intent(this, EditProfileActivity::class.java))
        }

    }
}