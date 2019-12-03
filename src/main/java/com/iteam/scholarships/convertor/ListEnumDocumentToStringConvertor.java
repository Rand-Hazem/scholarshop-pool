package com.iteam.scholarships.convertor;

import com.iteam.scholarships.enums.Scholarshipi;

import javax.persistence.AttributeConverter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class ListEnumDocumentToStringConvertor implements AttributeConverter<List<Scholarshipi.RequiredDocument>, String> {

    private final String DELIMITER = ",";

    @Override
    public String convertToDatabaseColumn(List<Scholarshipi.RequiredDocument> attribute) {
        if (attribute == null || attribute.size() == 0) {
            return null;
        }
        String [] arr = new String[attribute.size()];
        for(int i=0 ; i<arr.length ; i++){
            arr[i] = attribute.get(i).name();
        }
        return String.join(DELIMITER, arr);
    }

    @Override
    public List<Scholarshipi.RequiredDocument> convertToEntityAttribute(String dbData) {
        if (dbData == null || dbData.isEmpty()) {
            return null;
        }

        ArrayList<Scholarshipi.RequiredDocument> list =
                new ArrayList(Arrays.asList(dbData.split(DELIMITER)));
        return list;
    }
}
