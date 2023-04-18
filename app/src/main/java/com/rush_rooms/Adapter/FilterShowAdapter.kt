package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.Model.FilterShowModel
import com.rush_rooms.databinding.FillterShowItemBinding

class FilterShowAdapter(val con: Context, val showList: ArrayList<FilterShowModel>,val onPress:Click) :
    RecyclerView.Adapter<FilterShowAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: FillterShowItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup, viewType: Int
    ): MyViewHolder {
        return MyViewHolder(FillterShowItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        holder.mView.tvHeading.text =showList[position].name
        if (position == 2) {
            holder.mView.ivDownImg.visibility = View.VISIBLE
        } else if (position == 3) {
            holder.mView.ivDownImg.visibility = View.VISIBLE
        }
        holder.mView.main.setOnClickListener {
            onPress.onClick(position)
        }


    }

    override fun getItemCount(): Int {
        return showList.size
    }
    interface Click{
        fun onClick(pos:Int)
    }
}