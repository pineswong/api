# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Pays::User.create({
    username: 			'admin',
    password_digest: 	BCrypt::Password.create('admin', cost: BCrypt::Engine::MIN_COST),
    email: 				'pinewong@163.com',
    phone: 				'15275712310',
    admin: 				true,
    deleted: 			false,
    created_at: 		Time.zone.now,
    updated_at: 		Time.zone.now
})

Pays::Fuel.create({
	unit: 			'江西上饶燃气局',
	number: 			'8000113105',
	name: 			'黄松',
	address: 			'江西上饶',
	balance: 			'200',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Fuel.create({
	unit: 			'江西赣州燃气局',
	number: 			'8000113089',
	name: 			'李蓬',
	address: 			'江西江西赣州',
	balance: 			'100',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Fuel.create({
	unit: 			'江西赣州燃气局',
	number: 			'8000113092',
	name: 			'孙斌',
	address: 			'江西赣州',
	balance: 			'100',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Fuel.create({
	unit: 			'江西萍乡燃气局',
	number: 			'8000113082',
	name: 			'王丹',
	address: 			'江西萍乡',
	balance: 			'300',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Fuel.create({
	unit: 			'江西南昌燃气局',
	number: 			'8000113111',
	name: 			'张三',
	address: 			'江西南昌',
	balance: 			'50',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Fuel.create({
	unit: 			'江西景德镇燃气局',
	number: 			'8000113112',
	name: 			'李四',
	address: 			'江西景德镇',
	balance: 			'50',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})


# 水
Pays::Water.create({
	unit: 			'江西上饶水电局',
	number: 			'8000113105',
	name: 			'黄松',
	address: 			'江西上饶',
	balance: 			'200',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Water.create({
	unit: 			'江西上饶水电局',
	number: 			'8000113083',
	name: 			'杨志谦',
	address: 			'江西丰城',
	balance: 			'100',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Water.create({
	unit: 			'江西赣州水电局',
	number: 			'8000113089',
	name: 			'李蓬',
	address: 			'江西江西赣州',
	balance: 			'100',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Water.create({
	unit: 			'江西赣州水电局',
	number: 			'8000113092',
	name: 			'孙斌',
	address: 			'江西赣州',
	balance: 			'100',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Water.create({
	unit: 			'江西萍乡水电局',
	number: 			'8000113082',
	name: 			'王丹',
	address: 			'江西萍乡',
	balance: 			'300',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Water.create({
	unit: 			'江西南昌水电局',
	number: 			'8000113111',
	name: 			'张三',
	address: 			'江西南昌',
	balance: 			'50',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
Pays::Water.create({
	unit: 			'江西景德镇水电局',
	number: 			'8000113112',
	name: 			'李四',
	address: 			'江西景德镇',
	balance: 			'50',
	deleted: 			false,
  created_at: 		Time.zone.now,
  updated_at: 		Time.zone.now
})
