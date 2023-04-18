package com.rush_rooms.Adapter.ChatDetails

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.ChatDetailsItemBinding

class ChatDetailsAdapter(val con: Context) :
    RecyclerView.Adapter<ChatDetailsAdapter.MyViewHolder>() {
    class MyViewHolder (val mView:ChatDetailsItemBinding):RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ):MyViewHolder {
        return MyViewHolder(ChatDetailsItemBinding.inflate(LayoutInflater.from(con),parent,false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
        return 3
    }
}