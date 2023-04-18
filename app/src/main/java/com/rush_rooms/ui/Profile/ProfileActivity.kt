package com.rush_rooms.ui.Profile

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.Utils.CommonUtil
import com.rush_rooms.databinding.ActivityProfileBinding
import com.rush_rooms.ui.ChangePassword.ChangePasswordActivity
import com.rush_rooms.ui.InviteFriends.InviteFriendActivity
import com.rush_rooms.ui.ProfileOne.ProfileOneActivity
import com.rush_rooms.ui.Wallet.WalletActivity

class ProfileActivity : AppCompatActivity() {
    lateinit var binding: ActivityProfileBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityProfileBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
        CommonUtil.themeSet(this, window)
    }

    private fun initView() {
    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            finish()
        }
        binding.imageView9.setOnClickListener {
            startActivity(Intent(this, ProfileOneActivity::class.java))
        }
        binding.wallet.setOnClickListener {
            startActivity(Intent(this, WalletActivity::class.java))
        }
        binding.invite.setOnClickListener {
            startActivity(Intent(this, InviteFriendActivity::class.java))
        }
        binding.changePassword.setOnClickListener {
            startActivity(Intent(this, ChangePasswordActivity::class.java))
        }
    }
}