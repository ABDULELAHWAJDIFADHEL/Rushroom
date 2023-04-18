package com.rush_rooms.ui.AddGuestRooms

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.AddGuestAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityAddGuestRoomBinding
import com.rush_rooms.ui.Reviews.ReviewsActivity
import com.rush_rooms.ui.ShowResults.ShowResultsActivity

class AddGuestRoomActivity : AppCompatActivity() {
    lateinit var binding: ActivityAddGuestRoomBinding
    private var adptr: AddGuestAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAddGuestRoomBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.addGuestToolbar.tvTittle.text = getString(R.string.add_guets_rooms)
        binding.confromBtn.tvCommonTitle.text = getString(R.string.continues)

        binding.rvAddGuest.layoutManager = LinearLayoutManager(this)
        adptr = AddGuestAdapter(this)
        binding.rvAddGuest.adapter = adptr
        adptr!!.notifyDataSetChanged()


    }

    private fun lstnr() {
        binding.addGuestToolbar.ivBack.setOnClickListener {
            finish()
        }

        binding.confromBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this,ShowResultsActivity::class.java))
        }

    }
}