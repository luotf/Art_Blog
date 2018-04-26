package com.luotf.controller.admin;

import java.io.File;
import java.io.IOException;
import java.net.MalformedURLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.luotf.model.Blog;
import com.luotf.model.BlogType;
import com.luotf.service.BlogTypeService;
import com.luotf.util.subString;

@Controller
@RequestMapping(value = "/admin")
public class FileBrowseUtil {
	
	/**
     * 通过ajax请求获取传入的文件路径里边的文件fileList数组
     * @param req
     * @param resp
     * @param params 文件夹路径参数
     * @return
     * @throws ServletException
     * @throws IOException
     * @throws MalformedURLException
     */
    @RequestMapping("/getFileList")
    @ResponseBody
    protected Map CalculateGeoServlet(HttpServletRequest req,
            HttpServletResponse resp,String params) throws ServletException, IOException,
            MalformedURLException {
        ArrayList<String> fileList=new ArrayList<String>();
        fileList=getFiles(params,fileList);
        Map map=new HashMap();
        if(fileList.size()>0){
        	map.put("status", 200);
        }else{
        	map.put("status", 0);
        }
        map.put("fileList", fileList);
        return map;
    }
    /**
     * 通过递归得到某一路径下所有的目录及其文件
     * @param filePath 文件路径
     * @return
     */
    public static ArrayList<String> getFiles(String filePath,ArrayList<String> fileList) {
        ArrayList<String> fileListAll =fileList;
        File root = new File(filePath);
        File[] files = root.listFiles();
        for (File file : files) {
            if (file.isDirectory()) {
                /*
                 * 递归调用
                 */
                getFiles(file.getPath(),fileListAll);
                //fileList.add(file.getAbsolutePath());
            } else {
                String picPathStr = file.getPath();
                fileList.add(picPathStr);
                //System.out.println("显示"+filePath+"下所有子目录"+file.getAbsolutePath());
            }
        }
       /* for(String str:fileList){
            System.out.println(str);
        }*/
        return fileListAll;
    }
}
