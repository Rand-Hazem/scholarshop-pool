package com.iteam.scholarships.component;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.UUID;

@Component
public class UplodeFille {


    private String getFileExtention(String filename) {
        return filename.substring(filename.lastIndexOf(".") + 1);
    }

    private boolean validImage(String fileName) {
        return "jpg jpeg png".contains(getFileExtention(fileName));
    }

    /**
     * @return path of upladed image
     */
    public String upladeUserprofileImage(MultipartFile img, String oldImg) {
        try {
            if (!validImage(img.getOriginalFilename())) {
                return null;
            }
            // src/main/resources/static/uploaded/profile/" uniqeId
            String fileName = (oldImg!= null ? oldImg : "resources/static/uploaded/profile/"+UUID.randomUUID().toString() + ".jpg");
            File file = new File("src/main/"+fileName);

            if(!file.exists()){
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
        try {
            File file = new File("src/main/" + imgUrl);
            if (file.exists()) {
                return file.delete();
            }
            return false;
        } catch (Exception e) {
            System.out.println("\n\n" + e.getMessage() + "\n\n");
            return false;
        }
    }

}
