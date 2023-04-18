package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.NotiChildItemBinding

class NotiChildAdapter(val con:Context):RecyclerView.Adapter<NotiChildAdapter.MyViewHolder>() {
    class MyViewHolder(val mView:NotiChildItemBinding):RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ):MyViewHolder {
       return MyViewHolder(NotiChildItemBinding.inflate(LayoutInflater.from(con),parent,false))
    }

    override fun onBindViewHolder(holder:MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
       return 4
    }
}