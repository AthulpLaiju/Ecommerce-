"""houseboat URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.8/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import include, url
from django.contrib import admin
from dreamhomeapp.views import*
from django.views.generic import TemplateView
from django.conf import settings
from django.conf.urls.static import static
from django.contrib.staticfiles.urls import staticfiles_urlpatterns

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$',index,name="index"),
    url(r'^index/',index,name="index"),
    url(r'^userhome/',userhome,name="userhome"),
    url(r'^engreg/$',engreg,name='engreg'),
    url(r'^engaction/$',engaction,name='engaction'),
    url(r'^reg/',reg,name="reg"),
    url(r'^registeraction/',registeraction,name="registeraction"),
    url(r'^login/',login,name="login"),
    url(r'^searchlogin/',searchlogin,name="searchlogin"),
    url(r'^adminhome/',adminhome,name="adminhome"),
    url(r'^engineerhome/',engineerhome,name="engineerhome"),
    url(r'^bplan/',bplan,name="bplan"),
    url(r'^regbplanaction/',regbplanaction,name="regbplanaction"),
    url(r'^vengineer/',vengineer,name="vengineer"),
    url(r'^vuser/',vuser,name="vuser"),
    url(r'^veng/',veng,name="veng"),
    url(r'^vapreg/',vapreg,name="vapreg"),
    url(r'^uregstatus/',uregstatus,name="uregstatus"),
    url(r'^addplan/',addplan,name="addplan"),
    url(r'^planaction/',planaction,name="planaction"),
    url(r'^vengplan/',vengplan,name="vengplan"),
    url(r'^vengplan2/',vengplan2,name="vengplan2"),
    url(r'^addfback/',addfback,name="addfback"),
    url(r'^faction/',faction,name="faction"),
    url(r'^VFeedback/',VFeedback,name="VFeedback"),
    url(r'^reqplan2/',reqplan2,name="reqplan2"),
    url(r'^reqplan3/',reqplan3,name="reqplan3"),
    url(r'^Sregbplanaction/',Sregbplanaction,name="Sregbplanaction"),
    url(r'^regbplanaction/',regbplanaction,name="regbplanaction"),
    url(r'^addcplan/',addcplan,name="addcplan"),
    url(r'^addcplann/',addcplann,name="addcplann"),
    url(r'^vreqplan2/',vreqplan2,name="vreqplan2"),
    url(r'^vreqplann2/',vreqplann2,name="vreqplann2"),
    url(r'^planstatus/',planstatus,name="planstatus"),
    url(r'^upreqplan/',upreqplan,name="upreqplan"),
    url(r'^upplanaction/',upplanaction,name="upplanaction"),
    url(r'^newplan/',newplan,name="newplan"),
    url(r'^payment/',payment,name="payment"),
    url(r'^spayment/',spayment,name="spayment"),
    url(r'^ednewplan/',ednewplan,name="ednewplan"),
    url(r'^payaction/',payaction,name="payaction"),
    url(r'^spayaction/',spayaction,name="spayaction"),


]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += staticfiles_urlpatterns()
if settings.DEBUG:
    urlpatterns += static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
urlpatterns += static(settings.STATIC_URL, document_root=settings.STATIC_ROOT)
urlpatterns += staticfiles_urlpatterns()

