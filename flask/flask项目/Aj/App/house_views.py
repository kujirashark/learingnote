import os
from flask import Blueprint, render_template, request, session, jsonify

from App.models import Area, Facility, House, HouseImage
from utils import status_code
from utils.settings import UPLOAD_DIR
from utils.user_is_login import is_login
from App.models import db

house_blueprint = Blueprint('house', __name__)


@house_blueprint.route('/myhouse/', methods=['GET'])
@is_login
def my_house():
    return render_template('myhouse.html')


@house_blueprint.route('/newhouse/', methods=['GET'])
@is_login
def new_house():
    return render_template('newhouse.html')


@house_blueprint.route('/house_info/', methods=['GET'])
@is_login
def house_info():
    areas = Area.query.all()
    facilitys = Facility.query.all()

    areas_list = [area.to_dict() for area in areas]
    facilitys_list = [facility.to_dict() for facility in facilitys]
    return jsonify(code=status_code.ok, areas_list=areas_list, facilitys_list=facilitys_list)


@house_blueprint.route('/newhouseinfo/', methods=['POST'])
@is_login
def new_house_info():
    # 获取前端提交过来的参数
    params = request.form.to_dict()
    # 获取配置设备信息
    facility_ids = request.form.getlist('facility')
    # 创建House对象
    house = House()
    house.user_id = session['user_id']
    house.title = params.get('title')
    house.area_id = params.get('area_id')
    house.price = params.get('price')
    house.address = params.get('address')
    house.room_count = params.get('room_count')
    house.acreage = params.get('acreage')
    house.unit = params.get('unit')
    house.capacity = params.get('capacity')
    house.beds = params.get('beds')
    house.deposit = params.get('deposit')
    house.min_days = params.get('min_days')
    house.max_days = params.get('max_days')

    # 房屋和设施中间表添加信息
    if facility_ids:
        facility_list = Facility.query.filter(Facility.id.in_(facility_ids)).all()
        house.facilities = facility_list
    try:
        house.add_update()
    except:
        db.session.rollback()
        return jsonify(status_code.DATABASE_ERROR)
    return jsonify(code=status_code.ok, house_id=house.id)


@house_blueprint.route('/housing/', methods=['GET'])
@is_login
def my_housing():
    """我的房源信息"""
    houses = House.query.filter(House.user_id == session['user_id']).all()
    house_list = [house.to_dict() for house in houses]
    return jsonify(code=status_code.ok, house_list=house_list)


@house_blueprint.route('/houseimg/', methods=['POST'])
@is_login
def house_image():
    house_id = request.form.get('house_id')
    house_image = request.files.get('house_image')

    # 房屋图片地址
    image_url = os.path.join('upload', house_image.filename)

    # 保存房屋图片
    save_url = os.path.join(UPLOAD_DIR, house_image.filename)
    house_image.save(save_url)

    # 保存房屋的首图
    house = House.query.get(house_id)
    if not house.index_image_url:
        house.index_image_url = image_url

    # 保存房屋图片信息
    h_image = HouseImage()
    h_image.url = image_url
    h_image.house_id = house_id
    try:
        h_image.add_update()
    except:
        db.session.rollback()
        return jsonify(status_code.DATABASE_ERROR)
    return jsonify(code=status_code.ok, image_url=image_url)


@house_blueprint.route('/detail/', methods=['GET'])
def detail():
    """房间详情页"""
    return render_template('detail.html')


@house_blueprint.route('/detail/<int:id>/', methods=['GET'])
@is_login
def house_detail(id):
    """房间详情页接口"""
    house = House.query.get(id)
    house_info = house.to_full_dict()
    return jsonify(code=status_code.ok, house_info=house_info)


@house_blueprint.route('/booking/', methods=['GET'])
@is_login
def booking():
    return render_template('booking.html')
