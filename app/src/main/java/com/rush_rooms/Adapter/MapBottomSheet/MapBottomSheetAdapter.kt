package com.rush_rooms.Adapter.MapBottomSheet

import android.content.Context
import android.view.LayoutInflater
import android.view.ViewGroup
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.databinding.MapBottomSheetItemsBinding

class MapBottomSheetAdapter(val con: Context) :
    RecyclerView.Adapter<MapBottomSheetAdapter.MyViewHolder>() {
    class MyViewHolder(val mView: MapBottomSheetItemsBinding) : RecyclerView.ViewHolder(mView.root)

    override fun onCreateViewHolder(
        parent: ViewGroup,
        viewType: Int
    ): MyViewHolder {
        return MyViewHolder(
            MapBottomSheetItemsBinding.inflate(
                LayoutInflater.from(con),
                parent,
                false
            )
        )
    }

    override fun onBindViewHolder(holder: MyViewHolder, position: Int) {

    }

    override fun getItemCount(): Int {
       return 2
    }
}