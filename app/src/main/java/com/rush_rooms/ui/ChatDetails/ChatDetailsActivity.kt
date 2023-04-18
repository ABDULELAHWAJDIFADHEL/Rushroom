package com.rush_rooms.ui.ChatDetails

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.ChatDetails.ChatDetailsAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityChatDetailsBinding

class ChatDetailsActivity : AppCompatActivity() {
    lateinit var binding: ActivityChatDetailsBinding
    private var adpter: ChatDetailsAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityChatDetailsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.recyclerView.layoutManager = LinearLayoutManager(this)
        adpter = ChatDetailsAdapter(this)
        binding.recyclerView.adapter = adpter
        adpter!!.notifyDataSetChanged()


    }

    private fun lstnr() {
        binding.chatDetailsToolbar.ivBack.setOnClickListener {
            finish()
        }
    }
}