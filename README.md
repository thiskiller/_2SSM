# _2SSM
练习SSM框架的网上书城项目
### 项目中需要注意的知识点和易错点
1.如果Controller中找不到HttpServletRequest，需要找到Tomcat的lib文件夹中复制一份Servlet-api.jar。</br>
2.不同mapper文件中不能有相同的接口。</br>
3.单元测试测试类不会自动分配到dao、bean中的值，因为它只是在单元测试，没有启动服务器。</br>
4.在写rest风格时如果带参数的话，在requestMapping中也要写上所带的参数，如@requestMapping("getAll/{id}")。</br>
5.BigDecimal.valueOf()，可以将数据转为BigDecimal类型。将decimal类型转换为double类型，需要以String作为中介。</br>
6.用window.location.href在js中控制页面的url以实现转发的过程。</br>
7.在配置sql配置文件时，如果配置中需要传多个参数，需要用#{param1}....#{paramn}来取出，也可以通过@param()自定义。</br>
8.用户发来请求得url在请求头中referer中存着。</br>
9.在requestMapping中不能使用requestMapping("/manager")。</br>
10.request.getRequestURI()，能获取请求方的地址;request.getRequestURL()，获取的地址更全一些。</br>
11.在SSM中Date类型一般设为java.sql.Date，只有这样才能使用注解如@DateTimeFormat()等，需要创建当前时间是，用new Date(System.currentTimeMillis())。</br>
12.在jsp中获取参数用getParameter，不能一味的用getAttribute。</br>

