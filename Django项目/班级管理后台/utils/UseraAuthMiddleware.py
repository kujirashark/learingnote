from django.http import HttpResponseRedirect
from django.utils.deprecation import MiddlewareMixin
from django.core.urlresolvers import reverse
from user.models import Users


class UserAuthMiddle(MiddlewareMixin):

    def process_request(self, request):
        # 验证cookie中的ticket,验证不通过,跳转到登录
        # 验证通过,request.user当前登录的用户信息
        # return None或者不写return
        # 获取path
        path = request.path
        s = ['/user/login/', '/user/regiter/']
        if path in s:
            return None

        ticket = request.COOKIES.get('ticket')

        if not ticket:
            return HttpResponseRedirect(reverse('user:login'))
        user = Users.objects.filter(ticket=ticket).first()
        if not user:
            return HttpResponseRedirect(reverse('user:login'))

        request.user = user
