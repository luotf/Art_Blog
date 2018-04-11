<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>资源页_个人博客 - 一个在Java道路上的技术员个人博客网站</title>
<meta name="keywords" content="个人博客,罗廷方个人博客,罗廷方" />
<meta name="description" content="罗廷方个人博客，是一个在Java道路上的技术员个人博客网站" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="favicon.ico"> 
    <link href="${pageContext.request.contextPath}/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <link href="${pageContext.request.contextPath}/css/animate.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/base.css" rel="stylesheet">
    <link href="${pageContext.request.contextPath}/css/index.css" rel="stylesheet">
</head>
<header>
    <div id="mnav">
      <h2><span class="navicon"></span></h2>
      <ul>
      <li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
      <li><a href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
      <li><a href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
      <li><a href="/">留言</a></li>
      </ul>
    </div>
    <nav>
      <ul>
     <li><a href="${pageContext.request.contextPath}/page/index.jsp">网站首页</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">技术博客</a></li>
      <li><a href="${pageContext.request.contextPath}/page/list.jsp">面试汇总</a></li>
      <li><a href="${pageContext.request.contextPath}/page/project.jsp">项目案例</a></li>
      <li><a href="${pageContext.request.contextPath}/page/resource.jsp">资源分享</a></li>
      <li><a href="${pageContext.request.contextPath}/page/about.jsp">关于我</a></li>
      <li><a href="/">留言</a></li>
      </ul>
    </nav>
  </header>

  <article>
    <div class="leftbox">
      <div class="newblogs">
        
        <div class="row">
            <div class="col-sm-12">
                <div class="wrapper wrapper-content animated fadeInUp">
                    <ul class="notes" style="padding:0px;">
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>HTML5 文档类型</h4>
                                <p>Bootstrap 使用到的某些 HTML 元素和 CSS 属性需要将页面设置为 HTML5 文档类型。在你项目中的每个页面都要参照下面的格式进行设置。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>移动设备优先</h4>
                                <p>在 Bootstrap 2 中，我们对框架中的某些关键部分增加了对移动设备友好的样式。而在 Bootstrap 3 中，我们重写了整个框架，使其一开始就是对移动设备友好的。这次不是简单的增……</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>排版与链接</h4>
                                <p>Bootstrap 排版、链接样式设置了基本的全局样式。分别是： 为 body 元素设置 background-color: #fff; 使用 @font-family-base、@font-size-base 和……。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>Normalize.css</h4>
                                <p>为了增强跨浏览器表现的一致性，我们使用了 Normalize.css，这是由 Nicolas Gallagher 和 Jonathan Neal 维护的一个CSS 重置样式库。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>布局容器</h4>
                                <p>Bootstrap 需要为页面内容和栅格系统包裹一个 .container 容器。我们提供了两个作此用处的类。注意，由于 padding 等属性的原因，这两种 容器类不能互相嵌套。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>栅格系统</h4>
                                <p>Bootstrap 提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。它包含了易于使用的预定义类，还有强大的mixin 用于生成更具语义的布局。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>栅格系统</h4>
                                <p>Bootstrap 提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。它包含了易于使用的预定义类，还有强大的mixin 用于生成更具语义的布局。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>栅格系统</h4>
                                <p>Bootstrap 提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。它包含了易于使用的预定义类，还有强大的mixin 用于生成更具语义的布局。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                        <li style="margin: 10px 10px 30px 0px;overflow:visible;border:none;">
                            <div>
                                <small>2014年10月24日(星期五) 下午5:31</small>
                                <h4>栅格系统</h4>
                                <p>Bootstrap 提供了一套响应式、移动设备优先的流式栅格系统，随着屏幕或视口（viewport）尺寸的增加，系统会自动分为最多12列。它包含了易于使用的预定义类，还有强大的mixin 用于生成更具语义的布局。</p>
                                <a href="pin_board.html#"><i class="fa fa-trash-o "></i></a>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>


      </div>
    </div>

    <div class="rightbox animated fadeInUp">
      <div class="search1 ">
        <form action="/e/search/index.php" method="post" name="searchform" id="searchform">
          <input name="keyboard" id="keyboard" class="input_text" value="请输入关键字" style="color: rgb(153, 153, 153);" onfocus="if(value=='请输入关键字'){this.style.color='#000';value=''}" onblur="if(value==''){this.style.color='#999';value='请输入关键字'}" type="text">
          <input name="show" value="title" type="hidden">
          <input name="tempid" value="1" type="hidden">
          <input name="tbname" value="news" type="hidden">
          <input name="Submit" class="input_submit" value="搜索" type="submit">
        </form>
      </div>
      <div class="paihang">
        <h2 class="ab_title"><a href="/">本栏推荐</a></h2>
        <ul>
          <li><b><a href="/" target="_blank">住在手机里的朋友</a></b>
            <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门无学...</p>
          </li>
          <li><b><a href="/" target="_blank">教你怎样用欠费手机拨打电话</a></b>
            <p>对于刚毕业的学生来说，想学习建网站，掌握一技之长，最简单的入门...</p>
          </li>
          <li><b><a href="/" target="_blank">原来以为，一个人的勇敢是，删掉他的手机号码</a></b>
            <p>.先前发表过一篇文章《如果要学习web前端开发，需要学习什么？》</p>
          </li>
          <li><b><a href="/" target="_blank">手机的16个惊人小秘密，据说99.999%的人都不知</a></b>
            <p>对于刚毕业的学生来说，.需要学习什么？》</p>
          </li>
          <li><b><a href="/" target="_blank">你面对的是生活而不是手机</a></b>
            <p>.最简单的入门无非就是学会html和css，先前发表过一篇文章...</p>
          </li>
        </ul>
        <div class="ad"><img src="${pageContext.request.contextPath}/images/ad300x100.jpg"></div>
      </div>
      
    </div>
  </article>



    

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js?v=1.0.0"></script>



</html>
