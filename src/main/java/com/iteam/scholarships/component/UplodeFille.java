package com.iteam.scholarships.component;

import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
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


    private boolean delete(String path) {
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

    public void deleteAll(String path, List<String> list) {
        for (String img : list) {
            delete(path + img);
        }
    }

    private boolean save(String path, MultipartFile multipartFile){
        try {
            File fileOutput = new File(path);
            if (!fileOutput.exists()) {
                fileOutput.createNewFile();
            }
            BufferedImage bufferedImage = ImageIO.read(multipartFile.getInputStream());
            BufferedImage resBufferedImage1 = new BufferedImage(bufferedImage.getWidth(), bufferedImage.getHeight(), BufferedImage.TYPE_INT_RGB);
            resBufferedImage1.createGraphics().drawImage(bufferedImage, 0, 0, Color.WHITE, null);
            ImageIO.write(resBufferedImage1, "jpg", fileOutput);

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

            String fileName = (oldImg != null ? oldImg : UUID.randomUUID().toString() + ".jpg");

            return save("src/main/upload/profile/" + fileName, img) ? fileName : null;
        } catch (Exception e) {
            System.out.println("\n\n" + e.getMessage() + "\n\n");
            return null;
        }
    }


    public boolean deleteUserProfileImg(String imgUrl) {
        return delete("src/main/upload/profile/" + imgUrl);
    }


    public ArrayList<String> uploadeStoryImage(MultipartFile[] arrImg, ArrayList<String> oldImg) {
        ArrayList<String> newImgPath = new ArrayList<>(3);
        try {
            for (int i = 0; i < arrImg.length; i++) {
                String fileName = (oldImg != null && oldImg.size() >= i ? oldImg.get(i) : "" + UUID.randomUUID().toString() + ".jpg");

                // delete image
                if (arrImg[i] == null || arrImg[i].isEmpty()) {
                    delete("src/main/upload/story/" + fileName);
                    continue;
                }
                if (validImage(arrImg[i].getOriginalFilename()) && save("src/main/upload/story/" + fileName, arrImg[i])) {
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


    public void deleteAllStoryImg(List<String> list) {
        deleteAll("src/main/upload/story/", list);
    }

}
