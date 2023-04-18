package com.rush_rooms.Adapter

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.WishlistItemBinding
import com.rush_rooms.ui.BookingDetails.BookingDetailsActivity

class WishListAdapter(val con: Context, val changeTest: String) :
    RecyclerView.Adapter<WishListAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: WishlistItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
        return MyViewHolder(WishlistItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        if (changeTest.equals("Show")) {
            holder.mView.wishLay.setOnClickListener {
                con.startActivity(Intent(con,BookingDetailsActivity::class.java))
            }
        }

    }

    override fun getItemCount(): Int {
        return 5
    }
}