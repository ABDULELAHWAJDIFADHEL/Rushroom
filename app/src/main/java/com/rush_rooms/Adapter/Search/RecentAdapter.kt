package com.rush_rooms.Adapter.Search

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.RecentItemBinding
import com.rush_rooms.ui.ShowResults.ShowResultsActivity

class RecentAdapter(val con: Context) : RecyclerView.Adapter<RecentAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: RecentItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): MyViewHolder {
        return MyViewHolder(RecentItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.mView.recentLay.setOnClickListener {
            con.startActivity(Intent(con, ShowResultsActivity::class.java))
        }
    }

    override fun getItemCount(): Int {
        return 5
    }
}