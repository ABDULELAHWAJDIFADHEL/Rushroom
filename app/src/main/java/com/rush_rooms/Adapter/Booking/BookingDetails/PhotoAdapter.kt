package com.rush_rooms.Adapter.Booking.BookingDetails

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.Model.PhotoModal
import com.rush_rooms.databinding.PhotoItemBinding

class PhotoAdapter(val context : Context , val list : ArrayList<PhotoModal>) : RecyclerView.Adapter<PhotoAdapter.ViewHolder>() {

    class ViewHolder(var view : PhotoItemBinding):RecyclerView.ViewHolder(view.root){
    }
    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): PhotoAdapter.ViewHolder {
        return ViewHolder(PhotoItemBinding.inflate(LayoutInflater.from(context),parent,false))
    }

    override fun onBindViewHolder(holder: PhotoAdapter.ViewHolder, position: Int) {
        holder.view.imageview.setImageResource(list[holder.adapterPosition].img)
        holder.view.text.text = list[holder.adapterPosition].text

        if (holder.adapterPosition==0){
            holder.view.text.visibility = View.GONE
        }
        if (holder.adapterPosition==1){
            holder.view.text.visibility = View.GONE
        }
        if (holder.adapterPosition==2){
            holder.view.text.visibility = View.VISIBLE
        }
    }

    override fun getItemCount(): Int {
        return list.size
    }
}