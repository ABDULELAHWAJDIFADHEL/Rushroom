package com.rush_rooms.Fragment

import android.content.Intent
import android.os.Bundle
import androidx.fragment.app.Fragment
import android.view.LayoutInflater
import android.view.View
import android.view.ViewGroup
import android.view.animation.Animation
import android.view.animation.AnimationUtils
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.rush_rooms.Adapter.CategoryAdapter
import com.rush_rooms.Adapter.CityAdapter
import com.rush_rooms.databinding.FragmentHomeBinding
import com.rush_rooms.ui.AllCategory.AllCategoryActivity
import com.rush_rooms.ui.Booking.BookingActivity
import com.rush_rooms.ui.Notification.NotificationActivity
import com.rush_rooms.ui.PendingDetails.PendingDetailsActivity
import com.rush_rooms.ui.Search.SearchActivity
import com.rush_rooms.ui.WishList.WishListActivity


class HomeFragment : Fragment() {
    lateinit var binding: FragmentHomeBinding
    private var category_Adapter: CategoryAdapter? = null
    private var city_Adapter: CityAdapter? = null
    override fun onCreateView(
        inflater: LayoutInflater, container: ViewGroup?,
        savedInstanceState: Bundle?
    ): View? {
        binding = FragmentHomeBinding.inflate(layoutInflater)
        initView()
        lstnr()
        return (binding.root)
    }

    private fun initView() {
        val param =  binding.rvCategory.layoutParams
        binding.rvCategory.layoutParams = param
        binding.rvCategory.layoutManager =
            LinearLayoutManager(requireContext(), RecyclerView.HORIZONTAL, false)
        category_Adapter = CategoryAdapter(requireContext())
        binding.rvCategory.adapter = category_Adapter
        category_Adapter!!.notifyDataSetChanged()
        binding.rvCategory.scheduleLayoutAnimation()


        binding.rvCity.layoutManager =
            LinearLayoutManager(requireContext(), RecyclerView.HORIZONTAL, false)
        city_Adapter = CityAdapter(requireContext())
        binding.rvCity.adapter = city_Adapter
        city_Adapter!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        binding.ivHeart.setOnClickListener {
            startActivity(Intent(requireContext(), WishListActivity::class.java))
        }
        binding.ivNoti.setOnClickListener {
            startActivity(Intent(requireContext(), NotificationActivity::class.java))
        }
        binding.tvCategorySeemore.setOnClickListener {
            startActivity(Intent(requireContext(), AllCategoryActivity::class.java))
        }
        binding.editText.setOnClickListener {
            startActivity(Intent(requireContext(), SearchActivity::class.java))
        }
        binding.textView21.setOnClickListener {
            startActivity(Intent(requireContext(), PendingDetailsActivity::class.java))
        }

    }


}