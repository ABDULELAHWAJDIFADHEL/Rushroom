package com.rush_rooms.Adapter

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.CategoryItemBinding
import com.thekhaeng.pushdownanim.PushDownAnim

class CategoryAdapter(val con: Context) : RecyclerView.Adapter<CategoryAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: CategoryItemBinding) : RecyclerView.ViewHolder(mView.root) {
        init {
            PushDownAnim.setPushDownAnimTo(mView.categoryLay)
                .setScale(PushDownAnim.MODE_SCALE, 0.89f)
        }
    }

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
        return MyViewHolder(CategoryItemBinding.inflate(LayoutInflater.from(con), parent, false))
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
        return 6
    }
}