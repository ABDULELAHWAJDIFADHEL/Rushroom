package com.rush_rooms.Adapter.Booking

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.R
import com.rush_rooms.databinding.CommonItemBinding
import com.rush_rooms.ui.BookingDetails.BookingDetailsActivity
import com.rush_rooms.ui.PendingDetails.PendingDetailsActivity

class CommonAdapter(val con: Context, val chnageText: String, val onPress: Click) :
    RecyclerView.Adapter<CommonAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: CommonItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(CommonItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        if (chnageText.equals("Pending")) {
            holder.mView.tvConfromed.text = "Pending"
            holder.mView.cardCheckIn.visibility = View.INVISIBLE
            holder.mView.tvCheckOut.visibility = View.INVISIBLE
            holder.mView.commonLay.setOnClickListener {
                con.startActivity(Intent(con, PendingDetailsActivity::class.java))
            }
        } else if (chnageText.equals("Completed")) {
            holder.mView.tvConfromed.text = "Completed"
            holder.mView.cardCheckIn.visibility = View.INVISIBLE
            holder.mView.tvCheckOut.visibility = View.INVISIBLE
        } else if (chnageText.equals("Cancelled")) {
            holder.mView.tvConfromed.text = "Cancelled"
            holder.mView.tvConfromed.setBackgroundResource(R.drawable.red_bg)
            holder.mView.cardCheckIn.visibility = View.INVISIBLE
            holder.mView.tvCheckOut.visibility = View.INVISIBLE
        } else {
            holder.mView.cardCheckIn.visibility = View.VISIBLE
            holder.mView.tvCheckOut.visibility = View.VISIBLE
            holder.mView.cardCheckIn.setOnClickListener {
                onPress.onCheckIn(position)
            }
            holder.mView.tvCheckOut.setOnClickListener {
                onPress.onCheckOut(position)
            }

        }
        holder.mView.commonLay.setOnClickListener {
            con.startActivity(Intent(con, BookingDetailsActivity::class.java))
        }

    }

    override fun getItemCount(): Int {
        return 6
    }

    interface Click {
        fun onCheckIn(pos: Int)
        fun onCheckOut(pos: Int)
    }
}