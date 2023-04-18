package com.rush_rooms.ui.AllCategory

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.AllCategoryAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityAllCategoryBinding
import com.rush_rooms.ui.BookingSelection.BookingSelectionActivity

class AllCategoryActivity : AppCompatActivity() {
    lateinit var binding: ActivityAllCategoryBinding
    private var adptr: AllCategoryAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityAllCategoryBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.confromBtn.tvCommonTitle.text = getString(R.string.continues)
        binding.categoryToolbar.tvTittle.text = getString(R.string.categories)

        binding.rvCategory.layoutManager = LinearLayoutManager(this)
        adptr = AllCategoryAdapter(this)
        binding.rvCategory.adapter = adptr
        adptr!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        binding.categoryToolbar.ivBack.setOnClickListener {
            finish()
        }
        binding.confromBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, BookingSelectionActivity::class.java))
        }

    }
}