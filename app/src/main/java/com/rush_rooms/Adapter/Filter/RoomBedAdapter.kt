package com.rush_rooms.Adapter.Filter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.RoomBedItemBinding

class RoomBedAdapter(val con: Context) : RecyclerView.Adapter<RoomBedAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: RoomBedItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(RoomBedItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
      return 3
    }
}