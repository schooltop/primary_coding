# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20180727132536) do

  create_table "course_types", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "course_type_id"
    t.string "name"
    t.text "comment"
    t.integer "status", default: 0, comment: "0默认，1关闭"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_type_id"], name: "index_courses_on_course_type_id"
  end

  create_table "employee_course_details", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.bigint "employee_course_id"
    t.bigint "course_type_id", default: 0, comment: "0ruby,1python,2js"
    t.integer "status", default: 0, comment: "0练习，1作业"
    t.text "comment", comment: "编程内容"
    t.string "page_url", comment: "文件url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_type_id"], name: "index_employee_course_details_on_course_type_id"
    t.index ["employee_course_id"], name: "index_employee_course_details_on_employee_course_id"
    t.index ["employee_id"], name: "index_employee_course_details_on_employee_id"
  end

  create_table "employee_course_logs", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.bigint "employee_course_id"
    t.bigint "employee_course_detail_id"
    t.bigint "course_type_id"
    t.text "comment", comment: "编程内容"
    t.text "message", comment: "执行结果"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_type_id"], name: "index_employee_course_logs_on_course_type_id"
    t.index ["employee_course_detail_id"], name: "index_employee_course_logs_on_employee_course_detail_id"
    t.index ["employee_course_id"], name: "index_employee_course_logs_on_employee_course_id"
    t.index ["employee_id"], name: "index_employee_course_logs_on_employee_id"
  end

  create_table "employee_courses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.bigint "employee_id"
    t.bigint "course_id"
    t.integer "status", default: 0, comment: "0默认，1关闭"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["course_id"], name: "index_employee_courses_on_course_id"
    t.index ["employee_id"], name: "index_employee_courses_on_employee_id"
  end

  create_table "employees", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "员工表" do |t|
    t.string "email", default: "", null: false, comment: "email"
    t.string "encrypted_password", default: "", null: false, comment: "密码"
    t.integer "parent_id", default: 0, comment: "上级ID"
    t.datetime "created_at", null: false, comment: "创建日期"
    t.datetime "updated_at", null: false, comment: "修改日期"
    t.string "name", limit: 20, comment: "名字"
    t.integer "department_id", default: 0, null: false, comment: "部门ID"
    t.integer "position_id", default: 0, null: false, comment: "职位： 0:其它 6:财务 7:产品经理...."
    t.integer "position_level", default: 0, null: false, comment: "行政级别 0:员工 1:主管 2:经理 3:总监"
    t.integer "job_status", default: 1, null: false, comment: "在职状态, 1:在职, -1:离职"
    t.float "weight", limit: 24, default: 1.0, null: false, comment: "权重"
    t.date "joined_on", comment: "入职日期"
    t.integer "gender", comment: "性别 0:男 1:女"
    t.string "mobile", limit: 30, comment: "手机"
    t.string "qq", limit: 30, comment: "QQ"
    t.string "office_tel", limit: 30, comment: "公司电话"
    t.date "dob", comment: "生日"
    t.datetime "remember_created_at", comment: "记住创建日期"
    t.integer "deputy_department_id", default: 0, comment: "副部门"
    t.string "avatar", limit: 100, comment: "员工头像"
    t.integer "assign_count", default: 0, comment: "分配点数"
    t.integer "handover_id", default: 0, comment: "交接人"
    t.index ["email"], name: "index_employees_on_email", unique: true
  end

  create_table "employees_roles", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "员工权限表" do |t|
    t.integer "employee_id", comment: "员工ID"
    t.integer "role_id", comment: "员工权限"
    t.index ["employee_id", "role_id"], name: "index_employees_roles_on_employee_id_and_role_id"
  end

  create_table "roles", id: :integer, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8", comment: "角色表" do |t|
    t.string "name", comment: "角色名称"
    t.string "name_cn", comment: "中文名"
    t.datetime "created_at", comment: "创建日期"
    t.datetime "updated_at", comment: "修改日期"
    t.index ["name"], name: "index_roles_on_name"
  end

end
