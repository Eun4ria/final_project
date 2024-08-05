<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8" import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath }" />
<fmt:requestEncoding value="utf-8" />
<!DOCTYPE html>
<%--


 --%>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${path}/a00_com/bootstrap.min.css">
<link rel="stylesheet" href="${path}/a00_com/jquery-ui.css">
<link rel="stylesheet"
   href="${path}/a00_com/gantt/codebase/dhtmlxgantt.css?v=7.1.9">
<link rel="stylesheet"
   href="${path}/a00_com/gantt/common/jquery_multiselect.css?v=7.1.9">
<link rel="stylesheet" type="text/css"
   href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.css?v=7.1.9">
<style>
html, body {
   padding: 20px;
   margin: 20px;
   margin-top: 5px;
   height: 100%;
}

#gantt_here {
   width: 100%;
   height: 100%;
}

.gantt_grid_scale .gantt_grid_head_cell, .gantt_task .gantt_task_scale .gantt_scale_cell
   {
   font-weight: bold;
   font-size: 14px;
   color: rgba(0, 0, 0, 0.7);
}

.resource_marker {
   text-align: center;
}

.resource_marker div {
   width: 28px;
   height: 28px;
   line-height: 29px;
   display: inline-block;
   border-radius: 15px;
   color: #FFF;
   margin: 3px;
}

.resource_marker.workday_ok div {
   background: #51c185;
}

.resource_marker.workday_over div {
   background: #ff8686;
}

.owner-label {
   width: 20px;
   height: 20px;
   line-height: 20px;
   font-size: 12px;
   display: inline-block;
   border: 1px solid #cccccc;
   border-radius: 25px;
   background: #e6e6e6;
   color: #6f6f6f;
   margin: 0 3px;
   font-weight: bold;
}
</style>
<script src="${path}/a00_com/jquery.min.js"></script>
<script src="${path}/a00_com/popper.min.js"></script>
<script src="${path}/a00_com/bootstrap.min.js"></script>
<script src="${path}/a00_com/jquery-ui.js"></script>
<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
<script
   src="https://developers.google.com/web/ilt/pwa/working-with-the-fetch-api"
   type="text/javascript"></script>
<script src="${path}/a00_com/gantt/codebase/dhtmlxgantt.js?v=7.1.9"></script>
<script src="${path}/a00_com/gantt/common/jquery_multiselect.js?v=7.1.9"></script>
<script
   src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.js?v=7.1.9"></script>
<script
   src="${path}/a00_com/gantt/common/resource_project_multiple_owners.js?v=7.1.9"></script>



<script type="text/javascript">
   $(document).ready(function(){
      <%-- 
      
      --%>
      

      $("[name=project_num]").val(${ (empty param.project_num)?'1':param.project_num});

                  var project_num = $("[name=project_num]").val();
                  gantt.config.columns = [
                        {
                           name : "text",
                           tree : true,
                           width : 200,
                           resize : true
                        },
                        {
                           name : "start_date",
                           align : "center",
                           width : 80,
                           resize : true
                        },
                        {
                           name : "owner",
                           align : "center",
                           width : 75,
                           label : "Owner",
                           template : function(task) {
                              if (task.type == gantt.config.types.project) {
                                 return "";
                              }

                              var result = "";
                              var store = gantt
                                    .getDatastore("resource");
                              var owners = task[gantt.config.resource_property];

                              if (!owners || !owners.length) {
                                 return "Unassigned";
                              }

                              if (owners.length == 1) {
                                 return store.getItem(owners[0]).text;
                              }

                              owners
                                    .forEach(function(ownerId) {
                                       var owner = store
                                             .getItem(ownerId);
                                       if (!owner)
                                          return;
                                       result += "<div class='owner-label' title='" + owner.text + "'>"
                                             + owner.text
                                                   .substr(0,
                                                         1)
                                             + "</div>";

                                    });

                              return result;
                           },
                           resize : true
                        }, {
                           name : "duration",
                           width : 60,
                           align : "center"
                        }, {
                           name : "add",
                           width : 44
                        } ];
                  /*
                     var resourceConfig = {
                        columns: [
                           {
                              name: "name", label: "Name", tree:true, template: function (resource) {
                                 return resource.text;
                              }
                           },
                           {
                              name: "workload", label: "Workload", template: function (resource) {
                                 var tasks;
                                 var store = gantt.getDatastore(gantt.config.resource_store),
                                    field = gantt.config.resource_property;

                                 if(store.hasChild(resource.id)){
                                    tasks = gantt.getTaskBy(field, store.getChildren(resource.id));
                                 }else{
                                    tasks = gantt.getTaskBy(field, resource.id);
                                 }

                                 var totalDuration = 0;
                                 for (var i = 0; i < tasks.length; i++) {
                                    totalDuration += tasks[i].duration;
                                 }

                                 return (totalDuration || 0) * 8 + "h";
                              }
                           }
                        ]
                     };
                   */
                  gantt.templates.resource_cell_class = function(
                        start_date, end_date, resource, tasks) {
                     var css = [];
                     css.push("resource_marker");
                     if (tasks.length <= 1) {
                        css.push("workday_ok");
                     } else {
                        css.push("workday_over");
                     }
                     return css.join(" ");
                  };

                  gantt.templates.resource_cell_value = function(
                        start_date, end_date, resource, tasks) {
                     return "<div>" + tasks.length * 8 + "</div>";
                  };

                  gantt.locale.labels.section_owner = "Owner";
                  gantt.config.lightbox.sections = [ {
                     name : "description",
                     height : 38,
                     map_to : "text",
                     type : "textarea",
                     focus : true
                  },
                  //{name: "owner", height: 22, map_to: "owner_id", type: "select", options: gantt.serverList("people")},
                  {
                     name : "owner",
                     height : 60,
                     type : "multiselect",
                     options : gantt.serverList("people"),
                     map_to : "owner_id",
                     unassigned_value : 5
                  }, {
                     name : "time",
                     type : "duration",
                     map_to : "auto"
                  } ];

                  gantt.config.resource_store = "resource";
                  gantt.config.resource_property = "owner_id";
                  gantt.config.order_branch = true;
                  gantt.config.open_tree_initially = true;
                  gantt.config.layout = {
                     css : "gantt_container",
                     rows : [ {
                        cols : [ {
                           view : "grid",
                           group : "grids",
                           scrollY : "scrollVer"
                        }, {
                           resizer : true,
                           width : 1
                        }, {
                           view : "timeline",
                           scrollX : "scrollHor",
                           scrollY : "scrollVer"
                        }, {
                           view : "scrollbar",
                           id : "scrollVer",
                           group : "vertical"
                        } ],
                        gravity : 2
                     }, {
                        resizer : true,
                        width : 1
                     },
                     /*
                     ,
                     {
                        config: resourceConfig,
                        cols: [
                           {view: "resourceGrid", group:"grids", width: 435, scrollY: "resourceVScroll" },
                           {resizer: true, width: 1},
                           {view: "resourceTimeline", scrollX: "scrollHor", scrollY: "resourceVScroll"},
                           {view: "scrollbar", id: "resourceVScroll", group:"vertical"}
                        ],
                        gravity:1
                     },
                      */

                     {
                        view : "scrollbar",
                        id : "scrollHor"
                     } ]
                  };

                  var resourcesStore = gantt
                        .createDatastore({
                           name : gantt.config.resource_store,
                           type : "treeDatastore",
                           initItem : function(item) {
                              item.parent = item.parent
                                    || gantt.config.root_id;
                              item[gantt.config.resource_property] = item.parent;
                              item.open = true;
                              return item;
                           }
                        });

                  gantt.init("gantt_here");

                  resourcesStore.attachEvent("onParse", function() {
                     var people = [];
                     resourcesStore.eachItem(function(res) {
                        console.log(res);
                        if (!resourcesStore.hasChild(res.id)) {
                           var copy = gantt.copy(res);
                           copy.key = res.id;
                           copy.label = res.text;
                           people.push(copy);
                        }
                     });

                     console.log("#people#")
                     console.log(people)
                     gantt.updateCollection("people", people);
                  });
                  $.ajax({
                     type : "post",
                     data : "project_num=" + project_num,
                     url : "${path}/ganttList.do",
                     async : true,
                     dataType : "json",
                     success : function(data) {
                        console.log("데이터 출력");
                        console.log(data.ganttList)
                        console.log("자원 출력");
                        console.log(data.resource)
                        gantttasks = data.ganttList;
                        resourcesStore.parse(data.resource);
                        gantt.parse(data.ganttList);
                     }
                  });
                  

   });
</script>
</head>

<body>
   <div class="jumbotron text-center" style="padding: 15px 5px 10px 5px;">
      <h2>간트</h2>
   </div>
   <div id="gantt_here"></div>


</body>
</html>
