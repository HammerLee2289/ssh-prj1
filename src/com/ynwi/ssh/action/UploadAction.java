package com.ynwi.ssh.action;

import java.io.File;  
import java.io.FileInputStream;  
import java.io.FileNotFoundException;  
import java.io.FileOutputStream;  
import java.io.IOException;  
import java.io.InputStream;  
import java.io.OutputStream;  
import java.util.List;  
  



import org.apache.struts2.ServletActionContext;  
  



import com.opensymphony.xwork2.ActionSupport;  
  
public class UploadAction extends ActionSupport {   
      
         /**
	 * 
	 */
	private static final long serialVersionUID = 1L;
		//上传文件存放路径   
         private final static String UPLOADDIR = "/upload";   
         //上传文件集合   
         private List<File> file;   
         //上传文件名集合   
         private List<String> fileFileName;   
         //上传文件内容类型集合   
         private List<String> fileContentType; 
         //上传的图片名为用户名username
         private List<String> username;
         
         
         public List<String> getUsername() {
			return username;
		}

		public void setUsername(List<String> username) {
			this.username = username;
		}

		public List<File> getFile() {   
             return file;   
         }   
  
         public void setFile(List<File> file) {   
             this.file = file;   
         }   
  
        public List<String> getFileFileName() {   
            return fileFileName;   
        }   
  
         public void setFileFileName(List<String> fileFileName) {   
             this.fileFileName = fileFileName;   
         }   
  
         public List<String> getFileContentType() {   
             return fileContentType;   
         }   
  
         public void setFileContentType(List<String> fileContentType) {   
             this.fileContentType = fileContentType;   
         }   
  
         public String execute() throws Exception {  
        	 this.setFileFileName(username);
             System.out.println(this.getFileFileName());  
             for (int i = 0; i < file.size(); i++) {   
                 //循环上传每个文件   
                 uploadFile(i);   
             }   
             return "success";   
         }   
  
         //执行上传功能   
         private void uploadFile(int i) throws FileNotFoundException, IOException {
             try {   
                 InputStream in = new FileInputStream(file.get(i));   
                 String dir = ServletActionContext.getRequest().getRealPath(UPLOADDIR);  
                 File fileLocation = new File(dir);  
                 //此处也可以在应用根目录手动建立目标上传目录  
                 if(!fileLocation.exists()){  
                     boolean isCreated  = fileLocation.mkdir();  
                     if(!isCreated) {  
                         //目标上传目录创建失败,可做其他处理,例如抛出自定义异常等,一般应该不会出现这种情况。  
                         System.out.println("uploadFile error!");  
                     }  
                 }  
                 String fileName=this.getFileFileName().get(i);  
                 File uploadFile = new File(dir, fileName);   
                 OutputStream out = new FileOutputStream(uploadFile);   
                 byte[] buffer = new byte[1024 * 1024];   
                 int length;   
                 while ((length = in.read(buffer)) > 0) {   
                     out.write(buffer, 0, length);   
                 }   
                 in.close();   
                 out.close(); 
                 System.out.println("上传成功!");
             } catch (FileNotFoundException ex) {   
                 System.out.println("上传失败!");  
                 ex.printStackTrace();   
             } catch (IOException ex) {   
                 System.out.println("上传失败!");  
                 ex.printStackTrace();   
             }   
         }   
     }