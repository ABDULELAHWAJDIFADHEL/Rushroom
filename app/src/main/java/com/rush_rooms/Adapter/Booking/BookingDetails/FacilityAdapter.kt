package com.rush_rooms.Adapter.Booking.BookingDetails

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.Model.Facility_Modal
import com.rush_rooms.databinding.FacilityItemBinding

class FacilityAdapter(val context : Context, val list : ArrayList<Facility_Modal>) : RecyclerView.Adapter<FacilityAdapter.ViewHolder>(){

    class ViewHolder(val view: FacilityItemBinding):RecyclerView.ViewHolder(view.root){}
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): FacilityAdapter.ViewHolder {
        return ViewHolder(FacilityItemBinding.inflate(LayoutInflater.from(context),parent,false))
    }

    override fun onBindViewHolder(holder: FacilityAdapter.ViewHolder, position: Int) {
        holder.view.image.setImageResource(list[holder.adapterPosition].img)
        holder.view.text.text = list[position].text
    }

    override fun getItemCount(): Int {
        return list.size
    }
}