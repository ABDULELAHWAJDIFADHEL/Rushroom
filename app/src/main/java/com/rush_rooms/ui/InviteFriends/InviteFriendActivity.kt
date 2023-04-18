package com.rush_rooms.ui.InviteFriends

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.InviteAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityInviteFriendBinding

class InviteFriendActivity : AppCompatActivity() {
    lateinit var binding: ActivityInviteFriendBinding
    private var adpter: InviteAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityInviteFriendBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.inviteToolbar.tvTittle.text = getString(R.string.invite_friends)

        binding.rvInvite.layoutManager = LinearLayoutManager(this)
        adpter = InviteAdapter(this)
        binding.rvInvite.adapter = adpter
        adpter!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        binding.inviteToolbar.ivBack.setOnClickListener {
            finish()
        }

    }
}