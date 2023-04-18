package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.ReviewsItemBinding

class ReviewsAdapter(val con: Context) : RecyclerView.Adapter<ReviewsAdapter.MyViewHolder>() {
    class MyViewHolder(val mView:ReviewsItemBinding):RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(ReviewsItemBinding.inflate(LayoutInflater.from(con),parent,false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
       return  4
    }
}