from datetime import datetime

from flask import Blueprint,session,render_template,request,jsonify

from utils import status_code
from utils.user_is_login import is_login
from App.models import Order,House


order_blueprint = Blueprint('order',__name__)


@order_blueprint.route('/create_order/', methods=['POST'])
@is_login
def create_order():

    house_id = request.form.get('house_id')
    # 对前端传过来的时间值进行处理成可以做加法运算的
    begin_date = datetime.strptime(request.form.get('begin_date'),'%Y-%m-%d')
    end_date = datetime.strptime(request.form.get('end_date'),'%Y-%m-%d')
    user_id = session['user_id']

    # 验证是否有填写时间
    if not all([begin_date,end_date]):
        return jsonify(status_code.ORDER_BEGIN_END_DATA_NOT_NULL)
    # 验证初始时间是否大于结束时间
    if not begin_date < end_date:
        return jsonify(status_code.ORDER_BEGIN_DATA_GT_END_DATA_ERROE)
    # 获取房屋信息
    try:
        house = House.query.get(house_id)
    except:
        return jsonify(status_code.DATABASE_ERROR)
    # 创建订单对象
    order = Order()
    order.house_id = house_id
    order.end_date = end_date
    order.begin_date = begin_date
    order.user_id = user_id
    order.days = (end_date - begin_date).days + 1
    order.house_price = house.price
    order.amount = order.days * order.house_price

    order.add_update()

    return jsonify(status_code.SUCCESS)