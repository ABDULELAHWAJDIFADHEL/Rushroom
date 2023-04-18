package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.SortByItemBinding

class SortByAdapter(val con: Context) : RecyclerView.Adapter<SortByAdapter.MyViewHolder>() {
    class MyViewHolder (val mView:SortByItemBinding):RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SortByAdapter.MyViewHolder {
       return MyViewHolder(SortByItemBinding.inflate(LayoutInflater.from(con),parent,false))
    }

    override fun onBindViewHolder(holder: SortByAdapter.MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
        return 6
    }
}