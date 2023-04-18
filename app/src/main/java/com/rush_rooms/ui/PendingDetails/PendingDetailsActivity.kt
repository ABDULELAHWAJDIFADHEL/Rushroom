package com.rush_rooms.ui.PendingDetails

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.Utils.CommonUtil
import com.rush_rooms.databinding.ActivityPendingDetailsBinding

class PendingDetailsActivity : AppCompatActivity() {
    lateinit var binding:ActivityPendingDetailsBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityPendingDetailsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
        CommonUtil.themeSet(this,window)
    }

    private fun initView() {

    }

    private fun lstnr() {

    }
}