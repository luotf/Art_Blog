<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 项目详情</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

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
<body class="gray-bg">
    <div class="row">
        <div class="col-sm-8" style="margin-left:17%">
            <div class="wrapper wrapper-content animated fadeInUp">
                <div class="ibox">
                    <div class="ibox-content">
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="m-b-md">
                                    <a href="project_detail.html#" class="btn btn-white btn-xs pull-right" style="background: #e20d3e;color: #fff;padding: 6px;font-size: 15px;font-weight: bold;">前往项目</a>
                                    <h2>搜购—研发组</h2>
                                </div>
                                <dl class="dl-horizontal">
                                    <dt>状态：</dt>
                                    <dd><span class="label label-primary">已取消</span>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-5">
                                <dl class="dl-horizontal">

                                    <dt>项目负责人：</dt>
                                    <dd>罗廷方</dd>
                                    <dt>周期：</dt>
                                    <dd>90+天</dd>
                                    <dt>客户：</dt>
                                    <dd><p class="text-navy"> 逛街族|青少年|中年人</p>
                                    </dd>
                                    <dt>版本：</dt>
                                    <dd>v1.1.2</dd>
                                </dl>
                            </div>
                            <div class="col-sm-7" id="cluster_info">
                                <dl class="dl-horizontal">

                                    <dt>最后更新：</dt>
                                    <dd>2014年 11月7日 22:03</dd>
                                    <dt>创建于：</dt>
                                    <dd>2014年 2月16日 03:01</dd>
                                    <dt>团队成员：</dt>
                                    <dd class="project-people">
                                        <a href="project_detail.html" style="float: left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/images/a3.jpg">
                                        </a>
                                        <a href="project_detail.html" style="float: left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/images/a1.jpg">
                                        </a>
                                        <a href="project_detail.html" style="float: left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/images/a2.jpg">
                                        </a>
                                        <a href="project_detail.html" style="float: left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/images/a4.jpg">
                                        </a>
                                        <a href="project_detail.html" style="float: left">
                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/images/a5.jpg">
                                        </a>
                                    </dd>
                                </dl>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <dl class="dl-horizontal">
                                    <dt>当前进度</dt>
                                    <dd>
                                        <div class="progress progress-striped active m-b-sm">
                                            <div style="width: 60%;" class="progress-bar"></div>
                                        </div>
                                        <small>当前已完成项目总进度的 <strong>60%</strong></small>
                                    </dd>
                                </dl>
                            </div>
                            


                        </div>
                        <div class="panel blank-panel">
                            <ul class="nav nav-tabs">
                            <li><a href="#">项目截图</a></li>
                        </ul>
                        <ul >
                            <li style="float: left;margin:4% 0% 0%  3%"><img alt="image" class="feed-photo" style="max-height: 230px;" src="${pageContext.request.contextPath}/images/p3.jpg"></li>
                            <li style="float: right;margin:4% 3% 0%  0%"><img alt="image" class="feed-photo"  style="max-height: 230px;" src="${pageContext.request.contextPath}/images/p3.jpg"></li>
                            <li style="float: left;margin:4% 0% 0%  3%"><img alt="image" class="feed-photo"  style="max-height: 230px;" src="${pageContext.request.contextPath}/images/p3.jpg"></li>
                            <li style="float: right;margin:4% 3% 0%  0%"><img alt="image" class="feed-photo"  style="max-height: 230px;" src="${pageContext.request.contextPath}/images/p3.jpg"></li>
                        </ul>
                        
                    </ul>
                    </div>
                        <div class="row m-t-sm">
                            <div class="col-sm-12">
                                <div class="panel blank-panel">
                                    <div class="panel-heading">
                                        <div class="panel-options">
                                            <ul class="nav nav-tabs">
                                                <li><a href="#">评论</a>
                                                </li>
                                                
                                            </ul>
                                        </div>
                                    </div>

                                    <div class="panel-body">

                                        <div class="tab-content">
                                            <div class="tab-pane active">
                                                <div class="feed-activity-list">
                                                   

                                                   

                                                    <div class="feed-element">
                                                        <a href="profile.html#" class="pull-left">
                                                            <img alt="image" class="img-circle" src="${pageContext.request.contextPath}/images/a2.jpg">
                                                        </a>
                                                        <div class="media-body ">
                                                            <small class="pull-right">2小时前</small>
                                                            <strong>作家崔成浩</strong> 抽奖中了20万
                                                            <br>
                                                            <small class="text-muted">今天 09:27 来自 Koryolink iPhone</small>
                                                            <div class="well">
                                                                抽奖，人民币2000元，从转发这个微博的粉丝中抽取一人。11月16日平台开奖。随手一转，万一中了呢？
                                                            </div>
                                                            <div class="pull-right">
                                                                <a class="btn btn-xs btn-white"><i class="fa fa-thumbs-up"></i> 赞 </a>
                                                                <a class="btn btn-xs btn-white"><i class="fa fa-heart"></i> 收藏</a>
                                                                <a class="btn btn-xs btn-primary"><i class="fa fa-pencil"></i> 评论</a>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    
                                                    
                                                </div>

                                            </div>
                                          
                                        </div>

                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
      
    </div>

    <!-- 全局js -->
    <script src="${pageContext.request.contextPath}/js/jquery.min.js?v=2.1.4"></script>
    <script src="${pageContext.request.contextPath}/js/bootstrap.min.js?v=3.3.6"></script>



    <!-- 自定义js -->
    <script src="${pageContext.request.contextPath}/js/content.js?v=1.0.0"></script>


    <script>
        $(document).ready(function () {

            $('#loading-example-btn').click(function () {
                btn = $(this);
                simpleLoad(btn, true)

                // Ajax example
                //                $.ajax().always(function () {
                //                    simpleLoad($(this), false)
                //                });

                simpleLoad(btn, false)
            });
        });

        function simpleLoad(btn, state) {
            if (state) {
                btn.children().addClass('fa-spin');
                btn.contents().last().replaceWith(" Loading");
            } else {
                setTimeout(function () {
                    btn.children().removeClass('fa-spin');
                    btn.contents().last().replaceWith(" Refresh");
                }, 2000);
            }
        }
    </script>

    <script type="text/javascript" src="http://tajs.qq.com/stats?sId=9051096" charset="UTF-8"></script>
    <!--统计代码，可删除-->

</body>

</html>
