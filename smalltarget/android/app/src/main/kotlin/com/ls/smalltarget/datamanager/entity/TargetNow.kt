package com.ls.smalltarget.datamanager.entity

import androidx.room.ColumnInfo
import androidx.room.Entity
import androidx.room.PrimaryKey

/**
 * 小目标-数据库表
 * 存储当前已选择的小目标
 */
@Entity(tableName = "target_now")
data class TargetNow(
        @PrimaryKey(autoGenerate = true) val id: Int,
        @ColumnInfo(name = "target_id") val targetId: String,
        @ColumnInfo(name = "target_name") val targetName: String,
        @ColumnInfo(name = "complete_day") val completeDay: Int,
        @ColumnInfo(name = "target_image") val targetImage: String,
        @ColumnInfo(name = "target_icon") val targetIcon: String
)