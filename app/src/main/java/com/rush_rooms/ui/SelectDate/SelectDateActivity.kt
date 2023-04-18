package com.rush_rooms.ui.SelectDate

import android.content.Intent
import android.graphics.Color
import android.graphics.drawable.Drawable
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.TypedValue
import android.view.View
import android.widget.TextView
import androidx.core.graphics.BlendModeColorFilterCompat
import androidx.core.graphics.BlendModeCompat
import androidx.core.view.children
import com.google.android.material.snackbar.Snackbar
import com.kizitonwose.calendar.core.CalendarDay
import com.kizitonwose.calendar.core.CalendarMonth
import com.kizitonwose.calendar.core.DayPosition
import com.kizitonwose.calendar.core.daysOfWeek
import com.kizitonwose.calendar.view.MonthDayBinder
import com.kizitonwose.calendar.view.MonthHeaderFooterBinder
import com.kizitonwose.calendar.view.ViewContainer


import com.rush_rooms.R
import com.rush_rooms.Utils.ContinuousSelectionHelper.getSelection
import com.rush_rooms.Utils.ContinuousSelectionHelper.isInDateBetweenSelection
import com.rush_rooms.Utils.ContinuousSelectionHelper.isOutDateBetweenSelection
import com.rush_rooms.Utils.CustomCalender.*
import com.rush_rooms.Utils.CustomCalender.getColorCompat
import com.rush_rooms.Utils.CustomCalender.getDrawableCompat
import com.rush_rooms.Utils.CustomCalender.setTextColorRes

import com.rush_rooms.Utils.DateSelection
import com.rush_rooms.Utils.dateRangeDisplayText

import com.rush_rooms.databinding.ActivitySelectDateBinding
import com.rush_rooms.databinding.Example4CalendarDayBinding
import com.rush_rooms.databinding.Example4CalendarHeaderBinding

import com.rush_rooms.ui.AddGuestRooms.AddGuestRoomActivity
import java.time.LocalDate
import java.time.YearMonth
import java.time.format.DateTimeFormatter

class SelectDateActivity : AppCompatActivity() {
    lateinit var binding: ActivitySelectDateBinding
    private var startdate: String = ""
    private var enddate: String = ""
    private val today = LocalDate.now()

    private var selection = DateSelection()

    private val headerDateFormatter = DateTimeFormatter.ofPattern("EEE'\n'd MMM")


    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        binding = ActivitySelectDateBinding.inflate(layoutInflater)
        setContentView(binding.root)
        initView()
        lstnr()
        val daysOfWeek = daysOfWeek()
        binding.legendLayout.root.children.forEachIndexed { index, child ->
            (child as TextView).apply {
                text = daysOfWeek[index].displayText()
                setTextSize(TypedValue.COMPLEX_UNIT_SP, 15f)
                setTextColorRes(R.color.example_4_grey)
            }
        }
        configureBinders()
        val currentMonth = YearMonth.now()
        binding.exFourCalendar.setup(
            currentMonth,
            currentMonth.plusMonths(12),
            daysOfWeek.first(),
        )
        binding.exFourCalendar.scrollToMonth(currentMonth)

        binding.exFourSaveButton.setOnClickListener click@{
            val (startDate, endDate) = selection
            if (startDate != null && endDate != null) {
                val text = dateRangeDisplayText(startDate, endDate)
                Snackbar.make(it, text, Snackbar.LENGTH_LONG).show()
                startActivity(Intent(this, AddGuestRoomActivity::class.java))
            }
//            parentFragmentManager.popBackStack()
        }

        bindSummaryViews()
    }

    private fun initView() {
        /*MaterialDatePicker.Builder.dateRangePicker().setSelection(
            Pair(
                MaterialDatePicker.thisMonthInUtcMilliseconds(),
                MaterialDatePicker.todayInUtcMilliseconds()
            )
        ).build()
            .apply {
                show(supportFragmentManager, this.toString())
                addOnPositiveButtonClickListener {

                    startdate = SimpleDateFormat("dd-MMM-yyyy ", Locale.getDefault()).format(
                        Date(it.first)
                    )
                    enddate = SimpleDateFormat(
                        "dd-MMM-yyyy",
                        Locale.getDefault()
                    ).format(Date(it.second))
                    println("---startdate---->${startdate}")
                    println("---enddate---->${enddate}")

//                    bin.tvDate.setText(
//                        SimpleDateFormat("dd-MMM-yyyy", Locale.getDefault()).format(
//                            Date(it.first)
//                        ).plus(" to ").plus(
//                            SimpleDateFormat(
//                                "dd-MMM-yyyy",
//                                Locale.getDefault()
//                            ).format(Date(it.second))
//                        )
//                    )
//                    getAllAttendanceList()

                }
            }*/
    }

    private fun lstnr() {
        binding.ivBack.setOnClickListener {
            finish()
        }
       /* binding.confromBtn.tvCommonTitle.setOnClickListener {
            startActivity(Intent(this, AddGuestRoomActivity::class.java))
        }*/
    }
    private fun bindSummaryViews() {
        binding.exFourStartDateText.apply {
            if (selection.startDate != null) {
                text = headerDateFormatter.format(selection.startDate)
                setTextColorRes(R.color.example_4_grey)
            } else {
                text = "Start Date"
                setTextColor(Color.GRAY)
            }
        }

        binding.exFourEndDateText.apply {
            if (selection.endDate != null) {
                text = headerDateFormatter.format(selection.endDate)
                setTextColorRes(R.color.example_4_grey)
            } else {
                text = "End Date"
                setTextColor(Color.GRAY)
            }
        }

        binding.exFourSaveButton.isEnabled = selection.daysBetween != null
    }


    override fun onStart() {
        super.onStart()
        val closeIndicator = getDrawableCompat(R.drawable.ic_launcher_background).apply {
            colorFilter = BlendModeColorFilterCompat.createBlendModeColorFilterCompat(
                getColorCompat(R.color.example_4_grey),
                BlendModeCompat.SRC_ATOP,
            )
        }
//        (activity as AppCompatActivity).supportActionBar?.setHomeAsUpIndicator(closeIndicator)
    }

    private fun configureBinders() {
        val clipLevelHalf = 5000
        val ctx = this
        val rangeStartBackground =
            ctx.getDrawableCompat(R.drawable.example_4_continuous_selected_bg_start).also {
                it.level = clipLevelHalf // Used by ClipDrawable
            }
        val rangeEndBackground =
            ctx.getDrawableCompat(R.drawable.example_4_continuous_selected_bg_end).also {
                it.level = clipLevelHalf // Used by ClipDrawable
            }
        val rangeMiddleBackground =
            ctx.getDrawableCompat(R.drawable.example_4_continuous_selected_bg_middle)
        val singleBackground = ctx.getDrawableCompat(R.drawable.example_4_single_selected_bg)
        val todayBackground = ctx.getDrawableCompat(R.drawable.example_4_today_bg)

        class DayViewContainer(view: View) : ViewContainer(view) {
            lateinit var day: CalendarDay // Will be set when this container is bound.
            val binding = Example4CalendarDayBinding.bind(view)

            init {
                view.setOnClickListener {
                    if (day.position == DayPosition.MonthDate &&
                        (day.date == today || day.date.isAfter(today))
                    ) {
                        selection = getSelection(
                            clickedDate = day.date,
                            dateSelection = selection,
                        )
                        this@SelectDateActivity.binding.exFourCalendar.notifyCalendarChanged()
                        bindSummaryViews()
                    }
                }
            }
        }

        binding.exFourCalendar.dayBinder = object : MonthDayBinder<DayViewContainer> {
            override fun create(view: View) = DayViewContainer(view)
            override fun bind(container: DayViewContainer, data: CalendarDay) {
                container.day = data
                val textView = container.binding.exFourDayText
                val roundBgView = container.binding.exFourRoundBackgroundView
                val continuousBgView = container.binding.exFourContinuousBackgroundView

                textView.text = null
                roundBgView.makeInVisible()
                continuousBgView.makeInVisible()

                val (startDate, endDate) = selection

                when (data.position) {
                    DayPosition.MonthDate -> {
                        textView.text = data.date.dayOfMonth.toString()
                        if (data.date.isBefore(today)) {
                            textView.setTextColorRes(R.color.example_4_grey_past)
                        } else {
                            when {
                                startDate == data.date && endDate == null -> {
                                    textView.setTextColorRes(R.color.white)
                                    roundBgView.applyBackground(singleBackground)
                                }
                                data.date == startDate -> {
                                    textView.setTextColorRes(R.color.white)
                                    continuousBgView.applyBackground(rangeStartBackground)
                                    roundBgView.applyBackground(singleBackground)
                                }
                                startDate != null && endDate != null && (data.date > startDate && data.date < endDate) -> {
                                    textView.setTextColorRes(R.color.example_4_grey)
                                    continuousBgView.applyBackground(rangeMiddleBackground)
                                }
                                data.date == endDate -> {
                                    textView.setTextColorRes(R.color.white)
                                    continuousBgView.applyBackground(rangeEndBackground)
                                    roundBgView.applyBackground(singleBackground)
                                }
                                data.date == today -> {
                                    textView.setTextColorRes(R.color.example_4_grey)
                                    roundBgView.applyBackground(todayBackground)
                                }
                                else -> textView.setTextColorRes(R.color.example_4_grey)
                            }
                        }
                    }
                    // Make the coloured selection background continuous on the
                    // invisible in and out dates across various months.
                    DayPosition.InDate ->
                        if (startDate != null && endDate != null &&
                            isInDateBetweenSelection(data.date, startDate, endDate)
                        ) {
                            continuousBgView.applyBackground(rangeMiddleBackground)
                        }
                    DayPosition.OutDate ->
                        if (startDate != null && endDate != null &&
                            isOutDateBetweenSelection(data.date, startDate, endDate)
                        ) {
                            continuousBgView.applyBackground(rangeMiddleBackground)
                        }
                }
            }

            private fun View.applyBackground(drawable: Drawable) {
                makeVisible()
                background = drawable
            }
        }

        class MonthViewContainer(view: View) : ViewContainer(view) {
            val textView = Example4CalendarHeaderBinding.bind(view).exFourHeaderText
        }
        binding.exFourCalendar.monthHeaderBinder =
            object : MonthHeaderFooterBinder<MonthViewContainer> {
                override fun create(view: View) = MonthViewContainer(view)
                override fun bind(container: MonthViewContainer, data: CalendarMonth) {
                    container.textView.text = data.yearMonth.displayText()
                }
            }
    }

}