package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.CityItemBinding

class CityAdapter(val con:Context):RecyclerView.Adapter<CityAdapter.MyViewHolder>() {
    class MyViewHolder (val mView:CityItemBinding):RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
     return MyViewHolder(CityItemBinding.inflate(LayoutInflater.from(con),parent,false))
    }

    override fun onBindViewHolder(holder:MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
      return 8
    }
}