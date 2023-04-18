package com.rush_rooms.ui.Reviews

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.view.View
import androidx.recyclerview.widget.LinearLayoutManager
import com.rush_rooms.Adapter.ReviewsAdapter
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityReviewsBinding
import com.rush_rooms.ui.WriteReviews.WriteReviewsActivity

class ReviewsActivity : AppCompatActivity() {
    lateinit var binding: ActivityReviewsBinding
    private var adptr: ReviewsAdapter? = null
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityReviewsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.reviewToolbar.tvReviews.visibility = View.VISIBLE
        binding.reviewToolbar.tvTittle.text = getString(R.string.reviews)
        binding.reviewsBtn.tvCommonTitle.text = getString(R.string.write_review)

        binding.rvReviews.layoutManager = LinearLayoutManager(this)
        adptr = ReviewsAdapter(this)
        binding.rvReviews.adapter = adptr
        adptr!!.notifyDataSetChanged()

    }

    private fun lstnr() {
        binding.reviewToolbar.ivBack.setOnClickListener {
            finish()
        }
        binding.reviewsBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, WriteReviewsActivity::class.java))
        }

    }
}