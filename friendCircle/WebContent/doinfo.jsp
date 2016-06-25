<%@ page language="java" import="java.util.*,java.io.*"
	pageEncoding="UTF-8"%>
<%@ page import="org.apache.commons.fileupload.servlet.ServletFileUpload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.DiskFileItemFactory.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="friendCircle.UserAPI" %>
<%
	/*
	*处理上传图片-------------------------------------------
	
	response.setContentType("text/html");
	//   图片上传路径
	String uploadPath = request.getSession().getServletContext().getRealPath("/") + "upload/images/";
	//   图片临时上传路径
	String tempPath = request.getSession().getServletContext().getRealPath("/") + "upload/images/temp/";
	//   图片网络相对路径
	String imagePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ request.getContextPath() + "/";
	String picture="";
	//   文件夹不存在就自动创建：
	
	if (!new File(uploadPath).isDirectory())
		new File(uploadPath).mkdirs();
	if (!new File(tempPath).isDirectory())
		new File(tempPath).mkdirs();
	try {
	
		DiskFileUpload fu = new DiskFileUpload();
		//   设置最大文件尺寸，这里是4MB
		fu.setSizeMax(4194304);
		//   设置缓冲区大小，这里是4kb
		fu.setSizeThreshold(4096);
		//   设置临时目录：
		fu.setRepositoryPath(tempPath);
		//   得到所有的文件：
		List fileItems = fu.parseRequest(request);
		Iterator i = fileItems.iterator();
		//   依次处理每一个文件：
		while (i.hasNext()) {
			FileItem file = (FileItem) i.next();
			//   获得文件名，这个文件名是用户上传时用户的绝对路径：
			String sourcefileName = file.getName();
			if (sourcefileName != null
					&& (sourcefileName.endsWith(".jpg") || sourcefileName.endsWith(".gif"))) {
				//  在这里可以记录用户和文件信息,生成上传后的文件名
				String destinationfileName = null;
				Random rd = new Random();
				Calendar time = Calendar.getInstance();
				if (sourcefileName.endsWith(".jpg")) {
					destinationfileName = String.valueOf(time.get(Calendar.YEAR))
							+ String.valueOf(time.get(Calendar.MONTH))
							+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))
							+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
							+ String.valueOf(time.get(Calendar.MINUTE))
							+ String.valueOf(time.get(Calendar.SECOND))
							+ String.valueOf(rd.nextInt(100)) + ".jpg";
				} else if (sourcefileName.endsWith(".gif")) {
					destinationfileName = String.valueOf(time.get(Calendar.YEAR))
							+ String.valueOf(time.get(Calendar.MONTH))
							+ String.valueOf(time.get(Calendar.DAY_OF_MONTH))
							+ String.valueOf(time.get(Calendar.HOUR_OF_DAY))
							+ String.valueOf(time.get(Calendar.MINUTE))
							+ String.valueOf(time.get(Calendar.SECOND))
							+ String.valueOf(rd.nextInt(100)) + ".gif";
				}
				File f1 = new File(uploadPath + destinationfileName);
				file.write(f1);
				out.print(sourcefileName + "成功上传！");
				picture=uploadPath + "upload/images/" + destinationfileName;
				out.print("<img src=" + imagePath + "upload/images/" + destinationfileName + ">");
			} else {
				out.println("上传文件出错，只能上传 *.jpg , *.gif");
			}
		}
		//   跳转到上传成功提示页面
	}
	catch (Exception e) {
		//   可以跳转出错页面
	}
	*/
	
	
	/*
	* 处理其它信息------------------------------------------
	*/
	/*
	*默认，未被修改的信息
	*/
	request.setCharacterEncoding("utf-8");//防止中文乱码
	UserAPI u=new UserAPI();
	String userName=session.getAttribute("loginUser").toString();
	String[] pastDate=u.getUser(userName);
	String passWord=pastDate[1];
	String userId=pastDate[0];
	/*
	* ‘可能’ 被修改的信息
	* 用String param=输入为空？原值:改变值；来判断
	*
	*if(picture.equals(""))
	*	picture=pastDate[2];
	*/
	String sex=request.getParameter("sex");
	String email=request.getParameter("email").equals("")?pastDate[3]:request.getParameter("email");
	String signature=request.getParameter("signature").equals("")?pastDate[4]:request.getParameter("signature");
	String birth=request.getParameter("birthday").equals("")?pastDate[7]:request.getParameter("birthday");
	String city=request.getParameter("city").equals("")?pastDate[8]:request.getParameter("city");
	/*
	*更新数据库
	*/
	String picture="./bootstrap/img/display-photo/3.png";
	if(sex==null||sex.equals("0")) sex="男";
	else sex="女";
	String[] userDate=new String[]{
		userId,userName,passWord,email,signature,picture,sex,birth,city
	};
	u.addUser(userDate);
	response.sendRedirect("user-info.jsp");
%>