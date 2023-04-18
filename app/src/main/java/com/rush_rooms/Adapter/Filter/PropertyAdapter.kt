package com.rush_rooms.Adapter.Filter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.PropertyTypeItemBinding

class PropertyAdapter(val con: Context) : RecyclerView.Adapter<PropertyAdapter.MyViewHolder>() {
    class MyViewHolder(val mView:PropertyTypeItemBinding):RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
      return MyViewHolder(PropertyTypeItemBinding.inflate(LayoutInflater.from(con),parent,false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
        return 4
    }
}