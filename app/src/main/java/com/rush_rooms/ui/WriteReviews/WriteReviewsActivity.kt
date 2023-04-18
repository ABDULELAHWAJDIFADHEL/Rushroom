package com.rush_rooms.ui.WriteReviews

import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import com.rush_rooms.R
import com.rush_rooms.databinding.ActivityWriteReviewsBinding

class WriteReviewsActivity : AppCompatActivity() {
    lateinit var binding: ActivityWriteReviewsBinding
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivityWriteReviewsBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
    }

    private fun initView() {
        binding.writeReviewTool.tvTittle.text = getString(R.string.write_review)
        binding.commonBtn.tvCommonTitle.text = getString(R.string.send)

    }

    private fun lstnr() {
        binding.writeReviewTool.ivBack.setOnClickListener {
            finish()
        }

    }
}