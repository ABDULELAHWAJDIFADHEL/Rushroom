package com.rush_rooms.ui.WishList

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.WishListAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityWishListBinding

class WishListActivity : AppCompatActivity() {
    lateinit var binding: ActivityWishListBinding
    private var adptr: WishListAdapter? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityWishListBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.wishlistToolbar.tvTittle.text = getString(R.string.wishlist)
        binding.rvWishlist.layoutManager = LinearLayoutManager(this)
        adptr = WishListAdapter(this,"")
        binding.rvWishlist.adapter = adptr
        adptr!!.notifyDataSetChanged()
    }

    private fun lstnr() {
        binding.wishlistToolbar.ivBack.setOnClickListener {
            finish()
        }

    }
}