package com.rush_rooms.ui.Notification

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.NotiParentAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityNotificationBinding

class NotificationActivity : AppCompatActivity() {
    lateinit var bin: ActivityNotificationBinding
    private var adpter: NotiParentAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        bin = ActivityNotificationBinding.inflate(layoutInflater)
        setContentView(bin.root)
        initView()
        lstnr()
    }

    private fun initView() {
        bin.notiToolbar.tvTittle.text = getString(R.string.notification)
        bin.rvParentNoti.layoutManager = LinearLayoutManager(this)
        adpter = NotiParentAdapter(this)
        bin.rvParentNoti.adapter = adpter
        adpter!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        bin.notiToolbar.ivBack.setOnClickListener {
            finish()
        }

    }
}