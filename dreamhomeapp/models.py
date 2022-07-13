from django.db import models

# Create your models here.
class engmodel(models.Model):
    name=models.CharField(max_length=20)
    email=models.CharField(max_length=20)
    city=models.CharField(max_length=20)    
    phno=models.CharField(max_length=20)
    lno=models.CharField(max_length=20)       
    p_image=models.FileField(upload_to='pictures')
    pf_image=models.FileField(upload_to='pictures')
    passwd=models.CharField(max_length=20)
    class Meta:
        db_table="engineerr"

class planmodel(models.Model):
    engid=models.CharField(max_length=100)
    floor=models.CharField(max_length=100)
    bdroms=models.CharField(max_length=100)    
    bthrms=models.CharField(max_length=100)
    kitchn=models.CharField(max_length=100)       
    drms=models.CharField(max_length=100)
    strms=models.CharField(max_length=100)
    lvrms=models.CharField(max_length=100)
    sitrms=models.CharField(max_length=100)
    pcost=models.CharField(max_length=100)
    sqft=models.CharField(max_length=100)
    pl_image=models.FileField(upload_to='pictures')
    pf_image=models.FileField(upload_to='pictures')
    class Meta:
        db_table="addplan"

class reqplanmodel(models.Model):
    reqid=models.CharField(max_length=100)
    engid=models.CharField(max_length=100)
    custid=models.CharField(max_length=100)

    pcost=models.CharField(max_length=100)
    p_image=models.FileField(upload_to='pictures')
    p_file=models.FileField(upload_to='pictures')
 
    class Meta:
        db_table="upreqplan"

