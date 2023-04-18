package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.AllCategItemBinding

class AllCategoryAdapter(val con: Context) :
    RecyclerView.Adapter<AllCategoryAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: AllCategItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
        return MyViewHolder(AllCategItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        if (position == 1) {
            holder.mView.imageView19.visibility = View.VISIBLE
        } else if (position == 2) {
            holder.mView.imageView19.visibility = View.VISIBLE
        }
    }

    override fun getItemCount(): Int {
        return 4
    }
}