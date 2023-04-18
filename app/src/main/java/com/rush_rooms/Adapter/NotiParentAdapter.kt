package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.NotiParentItemBinding

class NotiParentAdapter(val con: Context) : RecyclerView.Adapter<NotiParentAdapter.MyViewHolder>() {
    private lateinit var notiChildItem: NotiChildAdapter
    private val viewPool = RecyclerView.RecycledViewPool()
    class MyViewHolder(val mView: NotiParentItemBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
        return MyViewHolder(NotiParentItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {
        notiChildItem =
            NotiChildAdapter(con)
        holder.mView.rvChildNoti.apply {
            adapter = notiChildItem
            layoutManager = LinearLayoutManager(context, RecyclerView.VERTICAL, false)
            setRecycledViewPool(viewPool)
        }
    }

    override fun getItemCount(): Int {
        return 3
    }
}