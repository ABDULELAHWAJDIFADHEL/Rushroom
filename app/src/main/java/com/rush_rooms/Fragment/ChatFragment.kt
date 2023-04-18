package com.rush_rooms.Fragment

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.ChatAdapter
import com.rush_rooms.Model.ChatModal
import com.rush_rooms.R
import com.rush_rooms.databinding.FragmentChatBinding
import com.rush_rooms.ui.Notification.NotificationActivity


class ChatFragment : Fragment() {
    lateinit var binding: FragmentChatBinding
    private var chatAdapter: ChatAdapter? = null
    private var chatList = ArrayList<ChatModal>()
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        // Inflate the layout for this fragment
        binding = FragmentChatBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return (binding.root)
    }

    private fun initView() {
        chatList.add(ChatModal(R.drawable.chat_item_img,"Dianne Russell","Hello, How can I help you","10:32"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Ronald Richards","Hello, How can I help you","10:32"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Devon Lane","Hello, How can I help you","Yesterday"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Annette Black","Hello, How can I help you","3 Jun"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Esther Howard","Hello, How can I help you","2 Jun"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Leslie Alexander","Hello, How can I help you","10 Feb"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Darlene Robertson","Hello, How can I help you","10 Feb"))
        chatList.add(ChatModal(R.drawable.chat_item_img,"Dianne Russell","Hello, How can I help you","3 Jun"))

        binding.rvCahat.layoutManager = LinearLayoutManager(requireContext())
        chatAdapter = ChatAdapter(requireContext(),chatList)
        binding.rvCahat.adapter = chatAdapter
        chatAdapter!!.notifyDataSetChanged()


    }

    private fun lstnr() {
        binding.ivNoti.setOnClickListener {
            startActivity(Intent(requireContext(),NotificationActivity::class.java))
        }

    }

}