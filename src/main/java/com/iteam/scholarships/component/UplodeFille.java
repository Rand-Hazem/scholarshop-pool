package com.iteam.scholarships.component;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

@Component
public class UplodeFille {


    private String getFileExtention(String filename) {
        return filename.substring(filename.lastIndexOf(".") + 1);
    }


    private boolean validImage(String fileName) {
        return "jpg jpeg png".contains(getFileExtention(fileName));
    }


    private boolean deleteFile(String path) {
        try {
            File file = new File(path);
            if (file.exists()) {
                return file.delete();
            }
            return false;
        } catch (Exception e) {
            System.out.println("\n\n" + e.getMessage() + "\n\n");
            return false;
        }
    }


    private boolean saveFile(String path, MultipartFile multipartFile) {
        try {
            File file = new File(path);
            if (!file.exists()) {
                file.createNewFile();
            }
            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
            stream.write(multipartFile.getBytes());
            stream.close();
            return true;
        } catch (Exception e) {
            System.out.println(e.getStackTrace());
            return false;
        }
    }


    /**
     * @return path of uploaded image
     */
    public String upladeUserprofileImage(MultipartFile img, String oldImg) {
        try {
            if (!validImage(img.getOriginalFilename())) {
                return null;
            }
            // src/main/resources/static/uploaded/profile/" uniqeId
            String fileName = (oldImg != null ? oldImg : "resources/static/uploaded/profile/" + UUID.randomUUID().toString() + ".jpg");
            File file = new File("src/main/" + fileName);

            if (!file.exists()) {
                file.createNewFile();
            }

            BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
            stream.write(img.getBytes());
            stream.close();
            return fileName;
        } catch (Exception e) {
            System.out.println("\n\n" + e.getMessage() + "\n\n");
            return null;
        }
    }


    public boolean deleteUserProfileImg(String imgUrl) {
        return deleteFile("src/main/" + imgUrl);
    }


    public ArrayList<String> uploadeStoryImage(MultipartFile[] arrImg, ArrayList<String> oldImg) {
        ArrayList<String> newImgPath = new ArrayList<>(3);
        try {
            for (int i = 0; i < arrImg.length; i++) {
                // src/main/resources/static/uploaded/story/" uniqeId
                String fileName = (oldImg != null && oldImg.size() >= i ? oldImg.get(i) : "resources/static/uploaded/story/" + UUID.randomUUID().toString() + ".jpg");

                // delete image
                if (arrImg[i] == null || arrImg[i].isEmpty()) {
                    deleteFile("src/main/" + fileName);
                    continue;
                }
                if (validImage(arrImg[i].getOriginalFilename()) && saveFile("src/main/" + fileName, arrImg[i])) {
                    newImgPath.add(fileName);
                }
            }
        } catch (Exception e) {
            System.out.println(e.fillInStackTrace());
        }
        return newImgPath;
    }


    public ArrayList<String> uploadeStoryImage(MultipartFile[] arrImg) {
        return uploadeStoryImage(arrImg, null);
    }


    public void deleteAll(List<String> list){
        for(String path: list){
            deleteFile("src/main/"+path);
        }
    }

}
