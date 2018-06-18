"""day10 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url, include
from django.contrib import admin
from django.contrib.staticfiles.urls import static
from day10.settings import MEDIA_URL, MEDIA_ROOT


urlpatterns = [
    url(r'^admin/', admin.site.urls),
    # 导入应用的中的url
    url(r'^app/',include('app.urls',namespace ='app')),
    url(r'^user/',include('user.urls',namespace='user')),

]

# 把media做成静态目录
urlpatterns += static(MEDIA_URL,document_root = MEDIA_ROOT)