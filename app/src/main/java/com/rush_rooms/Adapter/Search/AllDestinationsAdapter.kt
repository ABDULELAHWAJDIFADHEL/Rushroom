package com.rush_rooms.Adapter.Search

import android.content.Context
import android.content.Intent
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.AllCategItemBinding
import com.rush_rooms.databinding.CategoryItemBinding
import com.rush_rooms.ui.ShowResults.ShowResultsActivity

class AllDestinationsAdapter(val con: Context) :
    RecyclerView.Adapter<AllDestinationsAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: AllCategItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
        return MyViewHolder(AllCategItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.mView.allCategoryLay.setOnClickListener {
            con.startActivity(Intent(con, ShowResultsActivity::class.java))
        }
    }

    override fun getItemCount(): Int {
        return 6
    }
}