package com.iteam.scholarships.convertor;

import javax.persistence.AttributeConverter;
import java.util.ArrayList;
import java.util.List;

public class EnumListToStringConvertor<T extends Enum> implements AttributeConverter<List<T>, String> {

    private final String DELIMITER = ",";
    protected Class<? extends Enum> className;


    @Override
    public String convertToDatabaseColumn(List<T> attribute) {
        if (attribute == null || attribute.size() == 0) {
            return null;
        }

        String result = "";

        for (int i = 0; i < attribute.size(); i++) {
            result += (attribute.get(i)).name();
            if (i + 1 < attribute.size()) {
                result += DELIMITER;
            }
        }
        return result;
    }

    @Override
    public List<T> convertToEntityAttribute(String dbData) {
        if (dbData == null || dbData.isEmpty()) {
            return null;
        }
        ArrayList<T> list = new ArrayList();

        for (String val : dbData.split(DELIMITER)) {
            list.add((T) Enum.valueOf(className, val));
        }

        return list;
    }
}