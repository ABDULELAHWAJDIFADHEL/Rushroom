package com.rush_rooms.Fragment

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.WindowManager
import com.rush_rooms.R
import com.rush_rooms.Utils.CommonUtil
import com.rush_rooms.databinding.FragmentSettingBinding
import com.rush_rooms.ui.ChangePassword.ChangePasswordActivity
import com.rush_rooms.ui.InviteFriends.InviteFriendActivity
import com.rush_rooms.ui.ProfileOne.ProfileOneActivity
import com.rush_rooms.ui.Wallet.WalletActivity

class SettingFragment : Fragment() {
    lateinit var binding: FragmentSettingBinding
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        binding = FragmentSettingBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return (binding.root)

    }

    private fun initView() {


    }

    private fun lstnr() {

        binding.imageView9.setOnClickListener {
            startActivity(Intent(requireContext(), ProfileOneActivity::class.java))
        }
        binding.wallet.setOnClickListener {
            startActivity(Intent(requireContext(), WalletActivity::class.java))
        }
        binding.invite.setOnClickListener {
            startActivity(Intent(requireContext(), InviteFriendActivity::class.java))
        }
        binding.changePassword.setOnClickListener {
            startActivity(Intent(requireContext(), ChangePasswordActivity::class.java))
        }
    }


}