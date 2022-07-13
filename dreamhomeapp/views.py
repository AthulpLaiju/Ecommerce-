from django.shortcuts import render
from django.shortcuts import render,redirect,render_to_response,HttpResponseRedirect
from django.http import HttpResponse
from django.db import connection
from django.template import Context
from django.template.loader import get_template
from django.template import Template, Context
from dreamhomeapp.forms import pform,planform,reqplanform
from dreamhomeapp.models import engmodel,planmodel,reqplanmodel

def index(request):
	return render(request,'index.html')
def engreg(request):
	return render(request,'engreg.html')
def userhome(request):
	return render(request,'userhome.html')
def engineerhome(request):
	return render(request,'engineerhome.html')

def engaction(request):
    if request.method == "POST":
        Engform = pform(request.POST,request.FILES)
        if Engform.is_valid():
            profile =engmodel()
            profile.name=Engform.cleaned_data["name"]
            profile.email=request.POST["email"]
            profile.city=request.POST["city"]
            profile.phno=request.POST["phno"]  
            profile.lno=request.POST["lno"]   
            profile.p_image=Engform.cleaned_data["p_image"]
            profile.pf_image=Engform.cleaned_data["pf_image"]
            profile.passwd=request.POST["pass"]
            profile.save() 

            cursor=connection.cursor()         
            sqlemp="select max(engid) from engineerr"
            cursor.execute(sqlemp)
            result=cursor.fetchall()
            for row in result: 
                    id=int(row[0])
            sq="insert into login(uid,email,passwd,utype,status)values('%s','%s','%s','%s','%s')"%(id,profile.email,profile.passwd,'engineer','pending')
            cursor.execute(sq)
            html="<script>alert('Successfully Registered');window.location='/index/';</script>"
            saved = True
    else:
        Engform = pform()
    return HttpResponse(html)

def reg(request):
    return render(request,'clientreg.html')

def adminhome(request):
    return render(request,'adminhome.html')

def registeraction(request):
    cursor=connection.cursor()
    a=request.GET['t1']
    b=request.GET['t2']
    c=request.GET['t3']
    d=request.GET['t4']
    e=request.GET['t5']
    sql="insert into customer(custname,addr,email,phonno)values('%s','%s','%s','%s')"%(a,b,c,d)
    cursor.execute(sql)
    ut='customer'

    sqlemp="select max(cuid) from customer"
    cursor.execute(sqlemp)
    result=cursor.fetchall()
    for row in result: 
            id=int(row[0])
    sq="insert into login(uid,email,passwd,utype,status)values('%s','%s','%s','%s','%s')"%(id,c,e,ut,'Approve')
    cursor.execute(sq)
    msg="<script>alert('Sucessfully Added');window.location='/index/';</script>"
    return HttpResponse(msg)       

def login(request):
    return render(request,'login.html')
 
def searchlogin(request):
	cursor=connection.cursor()
	p=request.POST['t1']
	q=request.POST['t2']
	sql2="select * from login where email='%s' and passwd='%s' " %(p,q)
	cursor.execute(sql2)
	result=cursor.fetchall()
	if 	(cursor.rowcount) > 0:
		sql3 = "select * from login  where email='%s' and passwd='%s'  " % (p, q)
		cursor.execute(sql3)
		result1 = cursor.fetchall()
		for row1 in result1:
			request.session['id'] = row1[0]
			request.session['uid'] = row1[1]
			request.session['email'] = row1[2]
			request.session['passwd'] = row1[3]
			request.session['utype'] =row1[4]
			request.session['status'] =row1[5]
		if(request.session['utype']=='admin'):
			return render(request ,'adminhome.html') 
		elif(request.session['utype']=='customer'):
			return render(request ,'userhome.html')
		elif(request.session['utype']=='engineer')and (request.session['status']=='Approve'):
			return render(request ,'engineerhome.html')
	else:
		html="<script>alert('invalid password and username ');window.location='/index/';</script>"
		return HttpResponse(html)

def bplan(request):
    return render(request,'bplan.html')   
def vengineer(request):
    cursor=connection.cursor()
    s="select * from engineerr"
    cursor.execute(s)
    rs=cursor.fetchall()
    stu=[]
    for row in rs:
        y={'engid':row[0],'name':row[1],'email':row[2],'city':row[3],'phno':row[4],'lno':row[5],'p_image':row[6],}
        stu.append(y)
    return render(request,'vengineer.html',{'stu':stu})   

def vuser(request):
	cursor=connection.cursor()
	s="select * from customer"
	cursor.execute(s)
	rs=cursor.fetchall()
	usr=[]

	for row in rs: 
		y={'cuid':row[0],'custname':row[1],'addr':row[2],'email':row[3],'phonno':row[4]}
		usr.append(y)
	return render(request,'vuser.html',{'usr':usr})
def veng(request):
	cursor=connection.cursor()
	s="select * from engineerr inner join login on engineerr.engid=login.uid where login.status='pending'"
	cursor.execute(s)
	rs=cursor.fetchall()
	usr=[]

	for row in rs: 
		y={'engid':row[0],'name':row[1],'email':row[2],'city':row[3],'phno':row[4],'lno':row[5],'p_image':row[6],'pf_image':row[7]}
		usr.append(y)
	return render(request,'veng.html',{'usr':usr})
def vapreg(request):
	cursor=connection.cursor()
	s="select * from engineerr inner join login on engineerr.engid=login.uid where login.status='Approve'"
	cursor.execute(s)
	rs=cursor.fetchall()
	usr=[]

	for row in rs: 
		y={'engid':row[0],'name':row[1],'email':row[2],'city':row[3],'phno':row[4],'lno':row[5],'p_image':row[6]}
		usr.append(y)
	return render(request,'vapreg.html',{'usr':usr})
    
def uregstatus(request):
	cursor=connection.cursor()
	id=request.GET["id"]
	sts=request.GET["sts"]
	user=request.GET["user"]
	sql4="update login set status='%s' where uid='%s' and utype='%s'"%(sts,id,user) 
	cursor.execute(sql4)	
	html="<script>alert('successfully updated! ');window.location='/adminhome/';</script>"
	return HttpResponse(html)

def addplan(request):
    cursor=connection.cursor()
    s="select * from engineerr where engid='%s'"%(request.session['uid'])
    cursor.execute(s)
    rs=cursor.fetchall()
    usr=[]
    for row in rs:
        y={'engid':row[0],'name':row[1]}
        usr.append(y)

    return render(request,'addplan.html',{'usr':usr})

def planaction(request):
    if request.method == "POST":
        MyItemForm = planform(request.POST,request.FILES)
        if MyItemForm.is_valid():
            profile =planmodel()

            profile.engid=MyItemForm.cleaned_data["engid"]

            profile.floor=request.POST["floor"]
            profile.bdroms=request.POST["bedrooms"]
            profile.bthrms=request.POST["bathroom"]  
            profile.kitchn=request.POST["kitchen"]   
            profile.drms=request.POST["dining"]
            profile.strms=request.POST["stor"]
            profile.lvrms=request.POST["living"]  
            profile.sitrms=request.POST["sitout"]   
            profile.pcost=request.POST["pcost"]   
            profile.sqft=request.POST["sqft"]   

            profile.pl_image=MyItemForm.cleaned_data["pl_image"]
            profile.pf_image=MyItemForm.cleaned_data["pf_image"]

            profile.save() 

            html="<script>alert('Successfully Added');window.location='/addplan/';</script>"
            saved = True
    else:
        MyItemForm = planform()
    return HttpResponse(html)

def vengplan(request):
    cursor=connection.cursor()
    s="select * from addplan  inner join engineerr on engineerr.engid=addplan.engid "
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'engid':row[1],'floor':row[2],'bdroms':row[3],'bthrms':row[4],'kitchn':row[5],'drms':row[6],'strms':row[7],'lvrms':row[8],'sitrms':row[9],'pcost':row[10],'sqft':row[11],'pl_image':row[12],'pf_image':row[13],'status':row[14],'name':row[16],'phno':row[19],'p_image':row[21]}
        list.append(y)
    return render(request,'vengplan.html',{'list':list})   

def vengplan2(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    engid=request.GET["engid"]
    s="select * from addplan  where id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'engid':row[1],'floor':row[2],'bdroms':row[3],'bthrms':row[4],'kitchn':row[5],'drms':row[6],'strms':row[7],'lvrms':row[8],'sitrms':row[9],'pcost':row[10],'sqft':row[11],'pl_image':row[12],'pf_image':row[13]}
        list.append(y)

    sq="select * from engineerr  where engid='%s' " %(engid)
    cursor.execute(sq)
    rs=cursor.fetchall()
    listt=[]
    for row in rs:
        yq={'engid':row[0],'name':row[1],'phno':row[4],'p_image':row[6]}
        listt.append(yq)

        
    return render(request,'vengplan2.html',{'list':list,'listt':listt})   

def addfback(request):
    cursor=connection.cursor()
    s="select * from customer where cuid='%s'"%(request.session['uid'])
    cursor.execute(s)
    rs=cursor.fetchall()
    usr=[]
    for row in rs:
        y={'cuid':row[0],'email':row[3]}
        usr.append(y)

    return render(request,'addfback.html',{'usr':usr})
 
def faction(request):
    cursor=connection.cursor()
    a=request.GET['t3']
    b=request.GET['t2']
    sql="insert into feedback(email,feedback)values('%s','%s')"%(a,b)
    cursor.execute(sql)
    msg="<script>alert('Sucessfully Added');window.location='/addfback/';</script>"
    return HttpResponse(msg)   

def VFeedback(request):
	cursor=connection.cursor()
	s="select * from feedback"
	cursor.execute(s)
	rs=cursor.fetchall()
	usr=[]

	for row in rs: 
		y={'fid':row[0],'email':row[1],'feedback':row[2]}
		usr.append(y)
	return render(request,'VFeedback.html',{'usr':usr})

def reqplan2(request):
    cursor=connection.cursor()
    engid=request.GET["id"]
    s="select * from engineerr  where engid='%s' " %(engid)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'engid':row[0],'name':row[1]}
        list.append(y)

    s="select * from customer where cuid='%s'"%(request.session['uid'])
    cursor.execute(s)
    rs=cursor.fetchall()
    usr=[]
    for row in rs:
        y={'cuid':row[0],'email':row[3]}
        usr.append(y)

      
    return render(request,'reqplan2.html',{'list':list,'usr':usr})   

def regbplanaction(request):
    cursor=connection.cursor()

    a=request.POST["engid"]
    b=request.POST["custid"]
    c=request.POST["custmail"]
    d=request.POST["parea"]
    e=request.POST["floor"]
    f=request.POST["bedrooms"]
    g=request.POST["bathroom"]  
    h=request.POST["kitchen"]   
    i=request.POST["dining"]
    j=request.POST["stor"]
    k=request.POST["living"]  
    l=request.POST["sitout"]   
    m=request.POST["sqft"]   
    n='pending'   

    sql="insert into reqplan(engid,custid,custmail,parea,floor,bdroms,bthrms,kitchn,drms,strms,lvrms,sitrms,sqft,status)    values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" %(a,b,c,d,e,f,g,h,i,j,k,l,m,n)
    cursor.execute(sql)
    msg="<script>alert('Successfully Submitted Plan Request');window.location='/userhome/';</script>"
    return HttpResponse(msg)   

def addcplan(request):
    cursor=connection.cursor()
    s="select * from reqplan where status='pending'"
    cursor.execute(s)
    rs=cursor.fetchall()
    usr=[]
    for row in rs: 
        y={'id':row[0],'engid':row[1],'custid':row[2],'custmail':row[3],'parea':row[4],'floor':row[5],'bdroms':row[6],'bthrms':row[7],'kitchn':row[8],'drms':row[9],'strms':row[10],'lvrms':row[11],'sitrms':row[12],'sqft':row[13]}
        usr.append(y)
    return render(request,'addcplan.html',{'usr':usr})


def vreqplan2(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    s="select * from reqplan  where id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'engid':row[1],'custid':row[2],'custmail':row[3],'parea':row[4],'floor':row[5],'bdroms':row[6],'bthrms':row[7],'kitchn':row[8],'drms':row[9],'strms':row[10],'lvrms':row[11],'sitrms':row[12],'sqft':row[13]}
        list.append(y)
      
    return render(request,'vreqplan2.html',{'list':list})   
def vreqplann2(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    s="select * from reqplan  where id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'engid':row[1],'custid':row[2],'custmail':row[3],'parea':row[4],'floor':row[5],'bdroms':row[6],'bthrms':row[7],'kitchn':row[8],'drms':row[9],'strms':row[10],'lvrms':row[11],'sitrms':row[12],'sqft':row[13]}
        list.append(y)
      
    return render(request,'vreqplann2.html',{'list':list})   

def planstatus(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    sts=request.GET["sts"]
    sql4="update reqplan set status='%s' where id='%s' "%(sts,id) 
    cursor.execute(sql4)	
    html="<script>alert('Successfully updated! ');window.location='/addcplann/';</script>"
    return HttpResponse(html)

def addcplann(request):
    cursor=connection.cursor()
    s="select * from reqplan where status='Approve' and engid='%s' order by id desc"%(request.session['uid'])
    cursor.execute(s)
    rs=cursor.fetchall()
    usr=[]
    for row in rs: 
        y={'id':row[0],'engid':row[1],'custid':row[2],'custmail':row[3],'parea':row[4],'floor':row[5],'bdroms':row[6],'bthrms':row[7],'kitchn':row[8],'drms':row[9],'strms':row[10],'lvrms':row[11],'sitrms':row[12],'sqft':row[13]}
        usr.append(y)
    return render(request,'addcplann.html',{'usr':usr})

def upreqplan(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    s="select * from reqplan  where id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'engid':row[1],'custid':row[2],'custmail':row[3],'parea':row[4],'floor':row[5],'bdroms':row[6],'bthrms':row[7],'kitchn':row[8],'drms':row[9],'strms':row[10],'lvrms':row[11],'sitrms':row[12],'sqft':row[13]}
        list.append(y)
      
    return render(request,'upreqplan.html',{'list':list})   


def upplanaction(request):
    if request.method == "POST":
        MyItemForm = reqplanform(request.POST,request.FILES)
        if MyItemForm.is_valid():
            profile =reqplanmodel()

            profile.reqid=MyItemForm.cleaned_data["reqid"]
            profile.engid=MyItemForm.cleaned_data["engid"]
            profile.custid=MyItemForm.cleaned_data["custid"]
 
            profile.pcost=request.POST["pcost"]   

            profile.p_image=MyItemForm.cleaned_data["p_image"]
            profile.p_file=MyItemForm.cleaned_data["p_file"]
            profile.status='pending'   

            profile.save() 

            html="<script>alert('Successfully Submitted New Plan !!');window.location='/engineerhome/';</script>"
            saved = True
    else:
        MyItemForm = reqplanform()
    return HttpResponse(html)

def newplan(request):
    cursor=connection.cursor()
    s="select * from upreqplan  inner join reqplan on reqplan.id=upreqplan.reqid where upreqplan.custid='%s'"%(request.session['uid'])
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'reqid':row[1],'engid':row[2],'custid':row[3],'pcost':row[4],'p_image':row[5],'parea':row[12],'sqft':row[21]}
        list.append(y)


    return render(request,'newplan.html',{'list':list})   

def payment(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    a=request.GET["reqid"]
    b=request.GET["engid"]
    c=request.GET["cid"]
    s="select * from upreqplan  where id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'reqid':row[1],'engid':row[2],'custid':row[3],'pcost':row[4]}
        list.append(y)
    
    cursor1=connection.cursor()
    status='notpaid'
    q1="select status from upreqplan where id='%s'" %(id)
    cursor1.execute(q1)
    ros=cursor1.fetchall()

    for row1 in ros:
        status=row1[0]

    if(status=='paid'):
        msg="<script>window.location='/ednewplan?reqid=%s&engid=%s&cid=%s&id=%s';</script> " %(a,b,c,id)
        return HttpResponse(msg)   

    else:
        return render(request,'payment.html',{'list':list})   

def spayment(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    engid=request.GET["engid"]
    s="select * from addplan  where id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'engid':row[1],'pcost':row[10]}
        list.append(y)
    
    cursor1=connection.cursor()
    status='notpaid'
    q1="select status from spayment where reqid='%s' and custid='%s' " %(id,request.session['uid'])
    cursor1.execute(q1)
    ros=cursor1.fetchall()

    for row1 in ros:
        status=row1[0]

    if(status=='paid'):
        msg="<script>window.location='/vengplan2?id=%s&engid=%s&custid=%s';</script> " %(id,engid,request.session['uid'])
        return HttpResponse(msg)   

    else:
        return render(request,'spayment.html',{'list':list})   

def payaction(request):
    cursor=connection.cursor()
    id=request.GET['t0']
    a=request.GET['t1']
    b=request.GET['t2']
    c=request.GET['t3']
    d=request.GET['t4']
    e=request.GET['cno']

    sql="insert into payment(reqid,engid,custid,pcost,cno)values('%s','%s','%s','%s','%s')"%(a,b,c,d,e)
    cursor.execute(sql)

    sql4="update upreqplan set status='paid' where id='%s' "%(id) 
    cursor.execute(sql4)	

    msg="<script>alert('Payment Completed Sucessfully!!');window.location='/ednewplan?reqid=%s&engid=%s&cid=%s&id=%s';</script> " %(a,b,c,id)
    return HttpResponse(msg)   

def spayaction(request):
    cursor=connection.cursor()
    a=request.GET['t1']
    b=request.GET['t2']
    c=request.GET['t4']
    d=request.GET['cno']
    e=request.GET['edate']
    f='paid'

    sql="insert into spayment(reqid,engid,custid,pcost,status)values('%s','%s','%s','%s','%s')"%(a,b,request.session['uid'],c,f)
    cursor.execute(sql)

    msg="<script>alert('Payment Completed Sucessfully!!');window.location='/vengplan2?id=%s&engid=%s';</script> " %(a,b)
    return HttpResponse(msg)   

def ednewplan(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    reqid=request.GET["reqid"]
    engid=request.GET["engid"]
    cid=request.GET["cid"]

    s="select * from upreqplan inner join reqplan on reqplan.id=upreqplan.reqid WHERE  upreqplan.id='%s' " %(id)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'id':row[0],'reqid':row[1],'engid':row[2],'custid':row[3],'pcost':row[4],'p_image':row[5],'p_file':row[6],'parea':row[11],'floor':row[12],'bdroms':row[13],'bthrms':row[14],'kitchn':row[15],'drms':row[16],'strms':row[17],'lvrms':row[18],'sitrms':row[19],'sqft':row[20]}
        list.append(y)

    qs="select * from engineerr  where engid='%s' " %(engid)
    cursor.execute(qs)
    qrs=cursor.fetchall()
    listq=[]
    for row in qrs:
        qy={'engid':row[0],'name':row[1],'phno':row[4],'p_image':row[6]}
        listq.append(qy)

      
    return render(request,'ednewplan.html',{'list':list,'listq':listq})   

def reqplan3(request):
    cursor=connection.cursor()
    id=request.GET["id"]
    engid=request.GET["engid"]
    s="select * from engineerr  where engid='%s' " %(engid)
    cursor.execute(s)
    rs=cursor.fetchall()
    list=[]
    for row in rs:
        y={'engid':row[0],'name':row[1]}
        list.append(y)

    s="select * from customer where cuid='%s'"%(request.session['uid'])
    cursor.execute(s)
    rs=cursor.fetchall()
    usr=[]
    for row in rs:
        y={'cuid':row[0],'email':row[3]}
        usr.append(y)

    st="select * from addplan  where id='%s' and   engid='%s' " %(id,engid)
    cursor.execute(st)
    rst=cursor.fetchall()
    listt=[]
    for row in rst:
        ty={'id':row[0],'engid':row[1],'floor':row[2],'bdroms':row[3],'bthrms':row[4],'kitchn':row[5],'drms':row[6],'strms':row[7],'lvrms':row[8],'sitrms':row[9],'sqft':row[11]}
        listt.append(ty)
    
      
    return render(request,'reqplan3.html',{'list':list,'listt':listt,'usr':usr})   

def Sregbplanaction(request):
    cursor=connection.cursor()

    a=request.POST["engid"]
    b=request.POST["custid"]
    c=request.POST["custmail"]

    d=request.POST["parea"]
    e=request.POST["floor"]
    f=request.POST["bedrooms"]
    g=request.POST["bathroom"]  
    h=request.POST["kitchen"]   
    i=request.POST["dining"]
    j=request.POST["stor"]
    k=request.POST["living"]  
    l=request.POST["sitout"]   
    m=request.POST["sqft"]   
    n='pending'   

    sql="insert into reqplan(engid,custid,custmail,parea,floor,bdroms,bthrms,kitchn,drms,strms,lvrms,sitrms,sqft,status) values('%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s','%s')" %(a,b,c,d,e,f,g,h,i,j,k,l,m,n)
    cursor.execute(sql)
    msg="<script>alert('Successfully Submitted Plan Request');window.location='/userhome/';</script>"
    return HttpResponse(msg)   
