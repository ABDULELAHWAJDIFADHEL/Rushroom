package com.rush_rooms.Adapter

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.Model.ChatModal
import com.rush_rooms.databinding.ChatItemBinding
import com.rush_rooms.ui.ChatDetails.ChatDetailsActivity

class ChatAdapter(val con: Context, val chatList: ArrayList<ChatModal>) :
    RecyclerView.Adapter<ChatAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: ChatItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(ChatItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.mView.tvNameChat.text = chatList[position].name
        holder.mView.tvDesChat.text = chatList[position].des
        holder.mView.imageView5.setImageResource(chatList[position].img)
        holder.mView.tvTimeChat.text = chatList[position].time
        if (position == 0) {
            holder.mView.onlineView.visibility = View.VISIBLE
            holder.mView.tvCountChat.visibility = View.VISIBLE
        } else if (position == 1) {
            holder.mView.tvCountChat.visibility = View.VISIBLE
        } else if (position == 2) {
            holder.mView.onlineView.visibility = View.VISIBLE
        } else if (position == 4){
            holder.mView.onlineView.visibility = View.VISIBLE
        }
        holder.mView.chatLay.setOnClickListener {
            con.startActivity(Intent(con,ChatDetailsActivity::class.java))
        }
    }

    override fun getItemCount(): Int {
        return chatList.size
    }
}