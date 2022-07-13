from django import forms
from django.forms import CharField
from dreamhomeapp.models import engmodel,planmodel,reqplanmodel

class pform(forms.Form):
    name=forms.CharField(max_length=100)
    p_image=forms.FileField()
    pf_image=forms.FileField()
    class Meta:
        model = engmodel
        fields = ['name','email','city','phno','lno','p_image','pf_image','passwd']


class planform(forms.Form):
    engid=forms.CharField(max_length=100)
    pl_image=forms.FileField()
    pf_image=forms.FileField()
    class Meta:
        model = planmodel
        fields = ['engid','pl_image','pf_image'] 
        # fields = ['engid','floor','bdroms','bthrms','kitchn','drms','strms','lvrms','sitrms','pcost','p_image']

class reqplanform(forms.Form):
    reqid=forms.CharField(max_length=100)
    engid=forms.CharField(max_length=100)
    custid=forms.CharField(max_length=100)
    p_image=forms.FileField()
    p_file=forms.FileField()
    class Meta:
        model = planmodel
        fields = ['reqid','engid','custid','p_image','p_file'] 
