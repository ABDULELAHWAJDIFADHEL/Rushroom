package com.rush_rooms.ui.Search

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.Search.AllDestinationsAdapter
import com.rush_rooms.Adapter.Search.RecentAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivitySearchBinding

class SearchActivity : AppCompatActivity() {
    lateinit var binding: ActivitySearchBinding
    private var recentAdapter: RecentAdapter? = null
    private var all_des_adapter: AllDestinationsAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySearchBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.rvRecentSearch.layoutManager = LinearLayoutManager(this)
        recentAdapter = RecentAdapter(this)
        binding.rvRecentSearch.adapter = recentAdapter
        recentAdapter!!.notifyDataSetChanged()

        binding.rvAllDestniation.layoutManager = LinearLayoutManager(this)
        all_des_adapter = AllDestinationsAdapter(this)
        binding.rvAllDestniation.adapter = all_des_adapter
        all_des_adapter!!.notifyDataSetChanged()

    }

    private fun lstnr() {

    }
}