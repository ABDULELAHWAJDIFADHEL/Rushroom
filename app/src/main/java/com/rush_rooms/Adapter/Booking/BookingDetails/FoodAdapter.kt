package com.rush_rooms.Adapter.Booking.BookingDetails

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.Model.FoodModal
import com.rush_rooms.databinding.FoodItemBinding

class FoodAdapter(val context : Context , var list : ArrayList<FoodModal>) :
    RecyclerView.Adapter<FoodAdapter.ViewHolder>() {

    class ViewHolder(val view: FoodItemBinding):RecyclerView.ViewHolder(view.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FoodAdapter.ViewHolder {
        return ViewHolder(FoodItemBinding.inflate(LayoutInflater.from(context),parent,false))
    }

    override fun onBindViewHolder(holder: FoodAdapter.ViewHolder, position: Int) {
        holder.view.text.text = list[holder.adapterPosition].text


    }

    override fun getItemCount(): Int {
        return list.size
    }
}